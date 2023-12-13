class Game {
    var state : GameState
    let board : Board
    let redShiftCardDeck : [RedShiftCard]

    let navigator: Navigator
    let fuelManager : FuelManager

    var numberOfPlayers : Int {state.numberOfPlayers}
    var currentPlayer : Int {state.currentPlayerIndex+1}
    var locations: [Location] {board.locations}
    
    convenience init?(numberOfPlayers n: Int) {
        self.init(numberOfPlayers: n, board: StandardBoard())
    }
    init?(numberOfPlayers n: Int, board: Board, redShiftCards: [RedShiftCard] = RedShiftCardDeck.deal()) {
        guard n >= 1, n<=6 else {return nil}
        
        self.board = board
        self.redShiftCardDeck = redShiftCards
        self.state = GameState(for: board, numberOfPlayers: n)

        navigator = StandardNavigator(for: board)
        fuelManager = StandardFuelManager()
    }
    
    func moveCurrentPlayerTo(_ location: Int) {
        guard location >= 0, location < self.board.locations.count else {return}
        self.state.playerLocations[self.currentPlayer - 1] = location
    }
    
    func boardPositionOfCurrentPlayer() -> Int {
        return boardPositionOfPlayer(currentPlayer)!
    }
    func boardPositionOfPlayer(_ n: Int) -> Int? {
        let index = n-1
        guard index >= 0, index < state.playerLocations.count else {return nil}
        
        return state.playerLocations[n-1]
    }
    
    func locationForCurrentPlayer() -> Location {
        let pos = boardPositionOfCurrentPlayer()
        return board.locations[pos]
    }
    func locationForPlayer(_ n: Int) -> Location? {
        guard n >= 1, n <= numberOfPlayers else {return nil}
        
        if let playerPosition = boardPositionOfPlayer(n) {
            return board.locations[playerPosition]
        } else {
            return nil
        }
    }
    func currentLocationIsForSale() -> Bool {
        let position = boardPositionOfCurrentPlayer()
        let location = locationForCurrentPlayer()
        return self.state.ownerList[position] == 0 && location.price != nil
    }
    func locationForBoardPosition(_ pos: Int) -> Location? {
        guard pos < board.locations.count, pos >= 0 else {
            return nil
        }
        return board.locations[pos]
    }
    func buyProperty() -> Bool {
        guard currentLocationIsForSale() else {return false}
        guard let cost = locationForCurrentPlayer().price else { return false }
        guard cost <= federonsForCurrentPlayer() else {return false}
        
        addToCurrentPlayer(federons: -cost)
        let pos = boardPositionOfCurrentPlayer()
        self.state.ownerList[pos] = currentPlayer

        return true
    }
    
    func totalDebtForCurrentPlayer() -> Int {
        return state.players[currentPlayer-1].debt.reduce(0) { (sum, iou) -> Int in
            return sum + iou.owe
        }
    }
    func pay(_ amount: Int, toPlayer: Int) -> Bool {
        let senderIndex = currentPlayer-1
        let receiverIndex = toPlayer-1

        state.players[senderIndex].federons -= amount
        state.players[receiverIndex].federons += amount
        
        var availableFunds = amount
        while availableFunds > 0 {
            guard let index = state.players[senderIndex].debt.firstIndex(where: { $0.toPlayer == toPlayer}) else {break}
            
            let iou = state.players[senderIndex].debt[index]
            if iou.owe > availableFunds {
                let reduced = Player.IOU(owe: iou.owe - availableFunds, toPlayer: iou.toPlayer)
                availableFunds = 0
                state.players[senderIndex].debt.remove(at: index)
                state.players[senderIndex].debt.append(reduced)
            } else {
                availableFunds -= iou.owe
                state.players[senderIndex].debt.remove(at: index)
            }
        }
        
        return true
    }
    
    func fuelForCurrentPlayer() -> Int {
        return fuelForPlayer(currentPlayer)!
    }
    func fuelForPlayer(_ n: Int) -> Int? {
        guard n >= 1, n <= numberOfPlayers else {return nil}
        
        let playerIndex = n-1
        let result = state.players[playerIndex].hydrons
        return result
    }
    func currentPlayerIsStranded() -> Bool {
        return fuelManager.mustRefuelNow(hydrons: fuelForCurrentPlayer(), on: locationForCurrentPlayer())
    }
    
    func fuelStationsForCurrentPlayer() -> Int {
        let playerIndex = currentPlayer - 1
        return state.players[playerIndex].unplacedFuelStations
    }
    func takeCurrentPlayerOutOfTheGame() {
        let playerIndex = currentPlayer - 1
        return state.players[playerIndex].status = .outOfTheGame
    }
    
    func fuelDataForLocationOfCurrentPlayer() -> FuelData? {
        // Provide FuelData if fuel is available
        let location = locationForCurrentPlayer()
        let position = boardPositionOfCurrentPlayer()
        let hasFuel = (self.state.placedFuelStationLocations.contains(position) || location.hasFuelWithoutFuelStation)
        
        if let fuelRate = location.fuelCost,
           let cost = fuelRate.first,
            hasFuel {
            let owner = self.state.ownerList[position]
            return FuelData(rate: cost, fromPlayer: owner)
        } else {
            return nil
        }
    }
    struct FuelData: Equatable {
        let rate: Int
        let fromPlayer: Int
    }
    func buyFuel(hydrons hydronsToBuy: Int) -> Bool {
        let playerIndex = currentPlayer-1
        
        let neededToFillUp = 25 - state.players[playerIndex].hydrons
        guard neededToFillUp >= hydronsToBuy else {return false}
        guard let fuelRate = fuelDataForLocationOfCurrentPlayer()  else {return false}
        
        let cost = hydronsToBuy*fuelRate.rate
        guard state.players[playerIndex].federons >= cost else {return false}
        
        let owner = fuelRate.fromPlayer
        if owner == 0 { // Buy from federation
            state.players[playerIndex].federons -= cost
            state.players[playerIndex].hydrons += hydronsToBuy
        } else {
            // Buy from player
        }
        
        return true
    }
    
    func federonsForCurrentPlayer() -> Int {
        let playerIndex = currentPlayer - 1
        return state.players[playerIndex].federons
    }
    func addToCurrentPlayer(federons: Int) {
        let playerIndex = currentPlayer-1
        state.players[playerIndex].federons += federons
    }
    func addToCurrentPlayer(fuelStations: Int) {
        let playerIndex = currentPlayer-1
        state.players[playerIndex].unplacedFuelStations += fuelStations
    }

    
    func roll(_ die1: Int, _ die2: Int) -> [RollResult] {
        guard state.currentPlayerCanRoll else {
            state.rollResult = [.invalidRoll]
            return state.rollResult
        }
        
        state.rollResult = [RollResult]()
        let startPosition = boardPositionOfCurrentPlayer()
        
        if die1 == die2 {
            state.rollResult = redShift()
            
        } else if let result = resultOfRolling(die1, die2) {
            state.rollResult.append( result )
            let route = navigator.findRouteFor(amountToMove: die1+die2, from: startPosition)

            if currentPlayerIsStranded() {
                state.rollResult.append( .stranded )
                
                let position = boardPositionOfCurrentPlayer()
                let location = board.locations[position]
                let locationHasFuel = self.state.placedFuelStationLocations.contains(position) || location.hasFuelWithoutFuelStation
                let locationCanProvideFuel = location.canPlaceFuelStation
                let playerHasUnplacedFuelStation = fuelStationsForCurrentPlayer() > 0
                
                if !locationHasFuel, locationCanProvideFuel, !playerHasUnplacedFuelStation {
                    state.rollResult.append( .outOfTheGame )
                    takeCurrentPlayerOutOfTheGame()
                }
            }
            
            if didPassEarth(route: route) {
                addToCurrentPlayer(federons: 500)
            }
            
            if let endPoint = route.last {
                if let bonus = locations[endPoint].landingBonusFederons {
                    addToCurrentPlayer(federons: bonus)
                }
                if let bonus = locations[endPoint].landingBonusFuelStations {
                    addToCurrentPlayer(fuelStations: bonus)
                }
            }
            
        } else {
            // ERROR
            state.rollResult = [RollResult.invalidRoll]
        }
        state.currentPlayerCanRoll = false
                
        let location = locationForCurrentPlayer()
        let position = boardPositionOfCurrentPlayer()
        let owner = state.ownerList[position]
        if owner > 0, owner != currentPlayer {
            // Owe Rent
            if let rent = location.rent?.first {
                state.rollResult.append( .owe(player: owner, rent) )
                state.players[currentPlayer-1].debt.append(Player.IOU(owe: rent, toPlayer: owner))
            }
        }
        
        return state.rollResult
    }
    
    func endTurn() -> Bool {
        guard totalDebtForCurrentPlayer() == 0 else {return false}
        
        state.currentPlayerIndex += 1
        if currentPlayer > numberOfPlayers {
            state.currentPlayerIndex = 0
        }
        
        state.currentPlayerCanRoll = true
        
        return true
    }

    private func didPassEarth(route: [Int]) -> Bool {
        return route.contains(0)
    }

    func movePlayer(_ n: Int, to loc: Int) {
        state.playerLocations[n-1] = loc
    }
    
    private func redShift() -> [RollResult] {
        var result = [RollResult.redShift]
        
        let card = getRedShiftCard()
        result.append(contentsOf: rollResultsFromRedShiftCard(card))
                
        if let newPosition = card.goto, let fuelCost = card.use {
            
            movePlayer(currentPlayer, to: newPosition)
            state.players[currentPlayer-1].hydrons -= fuelCost
                        
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
        var card = redShiftCardDeck[state.nextRedShiftCard]
        state.nextRedShiftCard += 1
        if state.nextRedShiftCard >= redShiftCardDeck.count {
            state.nextRedShiftCard = 0
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
        let fuelCost = fuelManager.calculateFuelCost(toMove: value, from: locationForCurrentPlayer())
        
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

        let playerIndex = currentPlayer-1
        state.players[playerIndex].hydrons -= fuelCost
        
        movePlayer(currentPlayer, to: newPosition)
        
        let result = newPosition
        return result
    }
    
    func placeFuelStation(at pos: Int) -> Bool {
        if self.state.ownerList[pos] == currentPlayer,
           !self.state.placedFuelStationLocations.contains(pos) {
            self.state.placedFuelStationLocations.insert(pos)
            return true
        } else {
            return false
        }
    }
}
