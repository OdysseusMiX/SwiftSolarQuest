
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
}
