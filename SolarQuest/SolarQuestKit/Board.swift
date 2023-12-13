class Board {
    
    var playerPositions = [Int]()
    var numberOfPlayers : Int { playerPositions.count }
    
    var locations : [Location]
    
    
    init(numberOfPlayers: Int = 1) {
        let n = numberOfPlayers >= 1 ? numberOfPlayers : 1
        
        for _ in 1...n {
            self.playerPositions.append(0)
        }
        
        self.locations = StandardMap.createLocations()
    }
    
    func positionOfPlayer(_ n: Int) -> Int {
        playerPositions[n-1]
    }
    
    func place(player index: Int, at position: Int) {
        guard index >= 1, index <= numberOfPlayers else {return}
        guard position >= 0, position < locations.count else {return}
        
        playerPositions[index-1] = position
    }
        
}
