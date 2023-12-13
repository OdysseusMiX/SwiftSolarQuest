class StandardBoard : Board {
    
    
    var playerPositions = [Int]()
    var numberOfPlayers : Int { playerPositions.count }
    
    let locations : [Location]
    var oldLocations : [Location]
    let connections: [[Int]]
    
    init(numberOfPlayers: Int = 1) {
        let n = numberOfPlayers >= 1 ? numberOfPlayers : 1
        
        for _ in 1...n {
            self.playerPositions.append(0)
        }
        
        let map = StandardMap.createMap()
        self.locations = map.reduce([Location](), { (prior, arg1) -> [Location] in
            let (location, _) = arg1
            var result = prior
            result.append(location)
            return result
        })
        self.oldLocations = self.locations
        self.connections = map.reduce([[Int]](), { (prior, arg1) -> [[Int]] in
            let (_, connection) = arg1
            var result = prior
            result.append(connection)
            return result
        })
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
