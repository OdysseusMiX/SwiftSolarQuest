protocol Map {
    typealias MapData = [(MutableLocation, [Int])]
    
    static func createMap() -> MapData // [Int] is list of map indices this location connects to
    static func listLocations(in: MapData) -> [MutableLocation]
    static func listConnections(in data: MapData) -> [[Int]]
}

struct GenericMap : Map {
    static func listLocations(in data: MapData) -> [MutableLocation] {
        data.reduce([MutableLocation](), { (prior, arg1) -> [MutableLocation] in
            let (location, _) = arg1
            var result = prior
            result.append(location)
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
        return [(MutableLocation, [Int])]()
    }
    
    
}
