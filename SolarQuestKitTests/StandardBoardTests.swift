import XCTest
@testable import SolarQuest

final class StandardBoardTests: XCTestCase {
    
    //MARK: Create Board
//    func test_initBoardWithNoPlayers_boardHasOnePlayer() {
//        let board = StandardBoard(numberOfPlayers: 0)
//
//        XCTAssertEqual(board.numberOfPlayers, 1)
//    }
//
//    func test_createBoardWithOnePlayer() {
//        let board = StandardBoard(numberOfPlayers: 1)
//
//        XCTAssertEqual(board.numberOfPlayers, 1)
//    }
//
//    func test_createBoardWithTwoPlayers() {
//        let board = StandardBoard(numberOfPlayers: 2)
//
//        XCTAssertEqual(board.numberOfPlayers, 2)
//    }
    
    func test_usesStandardMapLocations() {
        let board : Board = StandardBoard()
        let locations : [Location] = StandardMap.listLocations(in: StandardMap.createMap())
        
        XCTAssertEqual(board.locations, locations)
    }
    
//    func test_getPositionOfPlayer1_0() {
//        let board = StandardBoard()
//
//        XCTAssertEqual(board.positionOfPlayer(1), 0)
//    }
//    func test_getPositionOfPlayer2_0() {
//        let board = StandardBoard(numberOfPlayers: 2)
//
//        XCTAssertEqual(board.positionOfPlayer(2), 0)
//    }

    
//    func test_movePlayer1OnBoard_atEndOfBoard() {
//        let board = StandardBoard()
//        let endOfBoard = board.locations.count - 1
//
//        board.place(player: 1, at: endOfBoard)
//
//        XCTAssertEqual(board.positionOfPlayer(1), endOfBoard)
//    }
//
//    func test_movePlayer2OnBoard_atEndOfBoard() {
//        let board = StandardBoard(numberOfPlayers: 2)
//        let endOfBoard = board.locations.count - 1
//
//        board.place(player: 2, at: endOfBoard)
//
//        XCTAssertEqual(board.positionOfPlayer(1), 0)
//        XCTAssertEqual(board.positionOfPlayer(2), endOfBoard)
//    }

//    static var allTests = [
//        ("testExample", test_createBoardWithOnePlayer),
//    ]

}
