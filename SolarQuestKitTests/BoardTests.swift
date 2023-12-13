import XCTest
@testable import SolarQuest

final class BoardTests: XCTestCase {
    /*
     Board is responsible for:
     - [X] a list of locations
     - [ ] orbit entry/exit points
     - [ ] where fuel stations have been placed
     - [ ] placing fuel stations
     - [X] where each player is
     - [X] placing and moving player pieces
     
     !! Who should be responsible for determining where a player can move to next for a given roll?
     */
    
    
    //MARK: Create Board
    func test_initBoardWithNoPlayers_boardHasOnePlayer() {
        let board = Board(numberOfPlayers: 0)
        
        XCTAssertEqual(board.numberOfPlayers, 1)
    }
    
    func test_createBoardWithOnePlayer() {
        let board = Board(numberOfPlayers: 1)
        
        XCTAssertEqual(board.numberOfPlayers, 1)
    }
    
    func test_createBoardWithTwoPlayers() {
        let board = Board(numberOfPlayers: 2)
        
        XCTAssertEqual(board.numberOfPlayers, 2)
    }
    
    func test_boardUsesMapLocations() {
        let board = Board()
        let locations = StandardMap.createLocations()
        
        XCTAssertEqual(board.locations, locations)
    }

    func test_getPositionOfPlayer1_0() {
        let board = Board()
        
        XCTAssertEqual(board.positionOfPlayer(1), 0)
    }
    func test_getPositionOfPlayer2_0() {
        let board = Board(numberOfPlayers: 2)
        
        XCTAssertEqual(board.positionOfPlayer(2), 0)
    }

    
    func test_movePlayer1OnBoard_atEndOfBoard() {
        let board = Board()
        let endOfBoard = board.locations.count - 1
        
        board.place(player: 1, at: endOfBoard)
        
        XCTAssertEqual(board.positionOfPlayer(1), endOfBoard)
    }
    
    func test_movePlayer2OnBoard_atEndOfBoard() {
        let board = Board(numberOfPlayers: 2)
        let endOfBoard = board.locations.count - 1
        
        board.place(player: 2, at: endOfBoard)
        
        XCTAssertEqual(board.positionOfPlayer(1), 0)
        XCTAssertEqual(board.positionOfPlayer(2), endOfBoard)
    }

    static var allTests = [
        ("testExample", test_createBoardWithOnePlayer),
    ]

}
