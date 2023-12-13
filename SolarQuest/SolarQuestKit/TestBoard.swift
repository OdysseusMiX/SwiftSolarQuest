
import Foundation

struct TestBoard : Board, Equatable {
    let locations: [Location]
    let connections: [[Int]]
    
    init() {
        self.oldLocations = [StandardMap.Earth(), StandardMap.Mars()]
        self.connections = [
            [1],
            [0]
        ]
        
        self.locations = self.oldLocations.reduce([Location](), { (prior, loc) -> [Location] in
            var result = prior
            result.append(loc.data)
            return result
        }) // TODO: Remove
    }
    
    // MARK: Deprecated
    //TODO: Remove all these
    var oldLocations: [LocationWithOrbitData]
    func positionOfPlayer(_: Int) -> Int {return 0}
    func place(player: Int, at: Int) {}
    
}
