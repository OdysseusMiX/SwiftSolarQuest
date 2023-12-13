
import Foundation

struct TestBoard : Board, Equatable {
    let locations: [Location]
    let connections: [[Int]]
    
    init() {
        self.locations = [StandardMap.Earth(), StandardMap.Mars()]
        self.connections = [
            [1],
            [0]
        ]
        
        self.oldLocations = self.locations // TODO: Remove
    }
    
    // MARK: Deprecated
    //TODO: Remove all these
    var oldLocations: [Location]
    func positionOfPlayer(_: Int) -> Int {return 0}
    func place(player: Int, at: Int) {}
    
}
