import XCTest
@testable import SolarQuest

class TestBoardTests: XCTestCase {

    var board : Board!
    
    override func setUpWithError() throws {
        self.board = TestBoard()
    }

    func testBoard_init_HasLocations() {
        let locations = [StandardMap.Earth(), StandardMap.Mars()]
        
        XCTAssertEqual(locations, self.board.locations)
    }

    func testBoard_init_HasConnections() {
        let connections = [[1],[0]]
        
        XCTAssertEqual(connections, self.board.connections)
    }
    
    func testBoard_init_startIsEarth() {
        XCTAssertEqual(self.board.locations[0].name, "Earth")
    }
    func testBoard_init_marsConnnectsToStart() {
        XCTAssertEqual(self.board.locations[1].name, "Mars")
        XCTAssertEqual(self.board.connections[1], [0])
    }
    
}


