
import Foundation

struct TestBoard : Board, Equatable {
    let locations: [Location]
    let connections: [[Int]]
    
    init() {
        self.locations = [StandardLocations.Earth(), StandardLocations.Mars()]
        self.connections = [
            [1],
            [0]
        ]
    }
    
    // MARK: Deprecated
    //TODO: Remove all these
    func positionOfPlayer(_: Int) -> Int {return 0}
    func place(player: Int, at: Int) {}
    
}
