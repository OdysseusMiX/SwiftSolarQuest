protocol Map {
    typealias MapData = [(LocationWithOrbitData, [Int])]
    
    static func createMap() -> MapData // [Int] is list of map indices this location connects to
    static func listLocations(in: MapData) -> [Location]
    static func listConnections(in data: MapData) -> [[Int]]
}

struct GenericMap : Map {
    static func listLocations(in data: MapData) -> [Location] {
        data.reduce([Location](), { (prior, arg1) -> [Location] in
            let (location, _) = arg1
            var result = prior
            result.append(location.data)
            return result
        })
    }
    static func listConnections(in data: MapData) -> [[Int]] {
        data.reduce([[Int]](), { (prior, arg1) -> [[Int]] in
            let (_, connection) = arg1
            var result = prior
            result.append(connection)
            return result
        })
    }

    static func createMap() -> MapData {
        return [(LocationWithOrbitData, [Int])]()
    }
    
    
}
