class Game {
    var players : [Player]
    var numberOfPlayers : Int {players.count}
    var currentPlayer : Int
    var canRoll : Bool
    var board : Board
    var navigator: Navigator
    var fuelManager : FuelManager
    var locations: [Location] {board.locations}
    var redShiftCardDeck = RedShiftCardDeck.deal()
    var nextRedShiftCard = 0
    
    var rollResult = [RollResult]()
    
    init?(numberOfPlayers n: Int) {
        guard n >= 1 else {return nil}
        
        players = [Player]()
        for i in 1...n {
            players.append(Player(name: "Player \(i)"))
        }
        
        board = Board(numberOfPlayers: n)
        navigator = StandardNavigator(locations: board.locations)
        fuelManager = StandardFuelManager()
        
        currentPlayer = 1
        canRoll = true
    }
    
    func boardPositionOfCurrentPlayer() -> Int {
        return boardPositionOfPlayer(currentPlayer)!
    }
    func boardPositionOfPlayer(_ n: Int) -> Int? {
        guard n >= 1, n <= players.count else {return nil}
        
        let result = board.positionOfPlayer(n)
        return result
    }
    
    func locationOfCurrentPlayer() -> Location {
        return locationOfPlayer(currentPlayer)!
    }
    func locationOfPlayer(_ n: Int) -> Location? {
        guard n >= 1, n <= players.count else {return nil}
        
        let playerPosition = board.positionOfPlayer(n)
        return board.locations[playerPosition]
    }
    func currentLocationIsForSale() -> Bool {
        guard boardPositionOfCurrentPlayer() != 0 else {
            return false
        }
        
        let location = locationOfCurrentPlayer()
        if location.owner == 0 {
            switch location.type {
            case .moon, .planet, .researchLab, .spaceDock:
                return true
            default:
                return false
            }
        } else {
            return false
        }
    }
    func deedCardForCurrentPosition() -> DeedCard? {
        return deedCardForBoardPosition(boardPositionOfCurrentPlayer())
    }
    func deedCardForBoardPosition(_ pos: Int) -> DeedCard? {
        return board.locations[pos].deedCard
    }
    func buyProperty() -> Bool {
        guard currentLocationIsForSale() else {return false}
        guard let cost = deedCardForBoardPosition(boardPositionOfCurrentPlayer())?.price else { return false }
        guard cost <= federonsForCurrentPlayer() else {return false}
        
        addToCurrentPlayer(federons: -cost)
        let pos = boardPositionOfCurrentPlayer()
        board.locations[pos].owner = currentPlayer

        return true
    }
    
    func totalDebtForCurrentPlayer() -> Int {
        return players[currentPlayer-1].debt.reduce(0) { (sum, iou) -> Int in
            return sum + iou.owe
        }
    }
    func pay(_ amount: Int, toPlayer: Int) -> Bool {
        let sender = players[currentPlayer-1]
        let receiver = players[toPlayer-1]
        
        sender.federons -= amount
        receiver.federons += amount
        
        var availableFunds = amount
        while availableFunds > 0 {
            guard let index = sender.debt.firstIndex(where: { $0.toPlayer == toPlayer}) else {break}
            
            let iou = sender.debt[index]
            if iou.owe > availableFunds {
                let reduced = Player.IOU(owe: iou.owe - availableFunds, toPlayer: iou.toPlayer)
                availableFunds = 0
                sender.debt.remove(at: index)
                sender.debt.append(reduced)
            } else {
                availableFunds -= iou.owe
                sender.debt.remove(at: index)
            }
        }
        
        return true
    }
    
    func fuelForCurrentPlayer() -> Int {
        return fuelForPlayer(currentPlayer)!
    }
    func fuelForPlayer(_ n: Int) -> Int? {
        guard n >= 1, n <= players.count else {return nil}
        
        let player = players[n-1]
        let result = player.hydrons
        return result
    }
    func currentPlayerIsStranded() -> Bool {
        return fuelManager.mustRefuelNow(hydrons: fuelForCurrentPlayer(), on: locationOfCurrentPlayer())
    }
    
    func fuelStationsForCurrentPlayer() -> Int {
        players[currentPlayer-1].unplacedFuelStations
    }
    func takeCurrentPlayerOutOfTheGame() {
        players[currentPlayer-1].status = .outOfTheGame
    }
    
    func fuelDataForLocationOfCurrentPlayer() -> FuelData? {
        let location = locationOfCurrentPlayer()
        
        if location.name == "Earth" {
            return FuelData(rate: 25, fromPlayer: 0)
        }
        
        guard location.hasFuel else {
            return nil
        }
        guard let rate = location.deedCard?.fuelRate?.first else {return nil} // TODO: Fix. This should not happen!
        
        return FuelData(rate: rate, fromPlayer: location.owner)
    }
    struct FuelData: Equatable {
        let rate: Int
        let fromPlayer: Int
    }
    func buyFuel(hydrons hydronsToBuy: Int) -> Bool {
        let player = players[currentPlayer-1]
        
        let neededToFillUp = 25 - player.hydrons
        guard neededToFillUp >= hydronsToBuy else {return false}
        guard let fuelRate = fuelDataForLocationOfCurrentPlayer()  else {return false}
        
        let cost = hydronsToBuy*fuelRate.rate
        guard player.federons >= cost else {return false}
        
        let owner = fuelRate.fromPlayer
        if owner == 0 { // Buy from federation
            player.federons -= cost
            player.hydrons += hydronsToBuy
        } else {
            // Buy from player
        }
        
        return true
    }
    
    func federonsForCurrentPlayer() -> Int {
        return players[currentPlayer-1].federons
    }
    func addToCurrentPlayer(federons: Int) {
        let player = players[currentPlayer-1]
        player.federons += federons
    }

    func locationAtBoardPosition(_ index: Int) -> Location? {
        guard index >= 0, index < locations.count else {return nil}
        
        return board.locations[index]
    }
    
    
    enum RollResult : Equatable {
        case invalidRoll
        case moved(Int)
        case moved(to: Int, fuelCost: Int)
        case owe(player: Int, Int)
        case stranded
        case redShift
        case message(String)
        case loseTurn
        case outOfTheGame
    }
    
    func roll(_ die1: Int, _ die2: Int) -> [RollResult] {
        guard canRoll else {
            rollResult = [.invalidRoll]
            return rollResult
        }
        
        rollResult = [RollResult]()
        let startPosition = boardPositionOfCurrentPlayer()
        
        if die1 == die2 {
            rollResult = redShift()
            
        } else if let result = resultOfRolling(die1, die2) {
            rollResult.append( result )
            
            if currentPlayerIsStranded() {
                rollResult.append( .stranded )
                
                if !locationOfCurrentPlayer().hasFuel && fuelStationsForCurrentPlayer() == 0 {
                    rollResult.append( .outOfTheGame )
                    takeCurrentPlayerOutOfTheGame()
                }
            }
            
        } else {
            // ERROR
            rollResult = [RollResult.invalidRoll]
        }
        canRoll = false
        
        if boardPositionOfCurrentPlayer() == 0 && startPosition != 0 {
            addToCurrentPlayer(federons: 1000)
        } else if didPassEarth(wentFrom: startPosition, to: boardPositionOfCurrentPlayer()) {
            addToCurrentPlayer(federons: 500)
        }
        
        let location = locationOfCurrentPlayer()
        if location.owner > 0, location.owner != currentPlayer {
            // Owe Rent
            if let rent = location.deedCard?.rent.first {
            rollResult.append( .owe(player: location.owner, rent) )
            players[currentPlayer-1].debt.append(Player.IOU(owe: rent, toPlayer: location.owner))
            }
        }
        
        return rollResult
    }
    
    func endTurn() -> Bool {
        guard totalDebtForCurrentPlayer() == 0 else {return false}
        
        currentPlayer += 1
        if currentPlayer > numberOfPlayers {
            currentPlayer = 1
        }
        
        canRoll = true
        
        return true
    }

    
    private func didPassEarth(wentFrom startPosition: Int, to endPosition: Int) -> Bool {
        let result : Bool
        
        if didEndInSameOrbit(startPosition, endPosition) {
            result = false
        } else {
            result = startPosition > endPosition
        }
        
        return result
    }
    private func didEndInSameOrbit(_ startPosition: Int, _ endPosition: Int) -> Bool {
        guard locations[startPosition].isInOrbit && locations[endPosition].isInOrbit else { return false }
        
        var pos = startPosition
        while locations[pos].isInOrbit {
            pos -= 1
        }
        let firstOrbitPosition = pos
        
        pos = startPosition
        while locations[pos].isInOrbit {
            pos += 1
        }
        let lastOrbitPosition = pos
        
        if endPosition >= firstOrbitPosition && endPosition <= lastOrbitPosition {
            return true
        } else {
            return false
        }
    }
    
    private func redShift() -> [RollResult] {
        var result = [RollResult.redShift]
        
        let card = getRedShiftCard()
        result.append(contentsOf: rollResultsFromRedShiftCard(card))
                
        if let newPosition = card.goto, let fuelCost = card.use {
            board.place(player: currentPlayer, at: newPosition)
            players[currentPlayer-1].hydrons -= fuelCost
                        
            if fuelForCurrentPlayer() < 0 {
                result.append( .outOfTheGame )
                result = result.filter { (rollResult) -> Bool in
                    switch rollResult {
                    case .moved(to: _, fuelCost: _):
                        return false
                    default:
                        return true
                    }
                }
                
                takeCurrentPlayerOutOfTheGame()
            }
        }
        
        return result
    }
    private func getRedShiftCard() -> RedShiftCard {
        var card = redShiftCardDeck[nextRedShiftCard]
        nextRedShiftCard += 1
        if nextRedShiftCard >= redShiftCardDeck.count {
            nextRedShiftCard = 0
        }
        
        if card.goto == nil && card.use != nil {
            // Do Not Move
            card.goto = boardPositionOfCurrentPlayer()
        }
        
        return card
    }
    private func rollResultsFromRedShiftCard(_ card: RedShiftCard) -> [RollResult] {
        var result = [RollResult.message(card.message)]
        if let fuelCost = card.use, let newPosition = card.goto {
            result.append( .moved(to: newPosition, fuelCost: fuelCost) )
        }
        return result
    }
    
    private func resultOfRolling(_ die1: Int, _ die2: Int) -> RollResult? {
        guard die1 >= 1, die2 >= 1, die1 <= 6, die2 <= 6 else {
            return nil
        }
        
        let total = die1 + die2
        
        let moveResult = moveCurrentPlayerIfFuelAllows(by: total)
        let result = RollResult.moved(to: moveResult.at, fuelCost: moveResult.used)
        
        return result
    }
    private func moveCurrentPlayerIfFuelAllows(by value: Int) -> (at: Int, used: Int) {
        let fuelCost = fuelManager.calculateFuelCost(toMove: value, from: locationOfCurrentPlayer())
        
        if fuelCost <= fuelForCurrentPlayer() {
            let newPosition = moveCurrentPlayer(by: value, fuelCost: fuelCost)
            let result = (at: newPosition, used: fuelCost)
            return result
        } else {
            return (at: boardPositionOfCurrentPlayer(), used: 0)
        }
    }
    private func moveCurrentPlayer(by value: Int, fuelCost: Int) -> Int {
        let newPosition = navigator.nextLocation(from: boardPositionOfCurrentPlayer(), moving: value)
        
        let player = players[currentPlayer-1]
        player.hydrons -= fuelCost
        
        board.place(player: currentPlayer, at: newPosition)
        
        let result = newPosition
        return result
    }
    
    private func calculateFuelCost(toMove: Int, from location: Location) -> Int {
        switch location.type {
        case .planet, .moon:
            return toMove
        default:
            return 0
        }
    }
    
}
