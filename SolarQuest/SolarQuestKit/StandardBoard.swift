class StandardBoard : Board {
    
    
    var playerPositions = [Int]()
    var numberOfPlayers : Int { playerPositions.count }
    
    let locations : [Location]
    var oldLocations : [LocationWithOrbitData]
    let connections: [[Int]]
    
    init(numberOfPlayers: Int = 1) {
        let n = numberOfPlayers >= 1 ? numberOfPlayers : 1
        
        for _ in 1...n {
            self.playerPositions.append(0)
        }
        
        let map = StandardMap.createMap()
        self.oldLocations = map.reduce([LocationWithOrbitData](), { (prior, arg1) -> [LocationWithOrbitData] in
            let (location, _) = arg1
            var result = prior
            result.append(location)
            return result
        })
        self.locations = self.oldLocations.reduce([Location](), { (prior, loc) -> [Location] in
            var result = prior
            result.append(loc.data)
            return result
        }) // TODO: Remove
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
