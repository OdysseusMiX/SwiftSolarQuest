import XCTest
@testable import SolarQuest

final class Game_initPlayersTests: XCTestCase {
        
// MOVE TO BOARD TESTS
//    func test_newGameHasBoardWithSameNumberOfPlayers() {
//        XCTAssertEqual(game.numberOfPlayers, 3)
//        XCTAssertEqual(game.board.numberOfPlayers, 3)
//    }
    
    func test_initGameWithNoPlayers_returnsNil() {
        let game = Game(numberOfPlayers: 0)
        
        XCTAssertTrue(game == nil)
    }

    func test_initGameWithNegativePlayers_returnsNil() {
        let game = Game(numberOfPlayers: -1)
        
        XCTAssertTrue(game == nil)
    }

    func test_initGameWithSevenPlayers_returnsNil() {
        let game = Game(numberOfPlayers: 7)
        
        XCTAssertTrue(game == nil)
    }

    func test_initGameWithTwoPlayers_returnsGame() {
        let game = Game(numberOfPlayers: 2)
        
        XCTAssertTrue(game != nil)
        XCTAssertTrue(game?.numberOfPlayers == 2)
    }

    func test_initGameWithOnePlayer_returnsGame() {
        let game = Game(numberOfPlayers: 1)
        
        XCTAssertTrue(game != nil)
        XCTAssertTrue(game?.numberOfPlayers == 1)
    }
    
    func test_initGameWithTwoPlayer_returnsGame() {
        let game = Game(numberOfPlayers: 1)
        
        XCTAssertTrue(game != nil)
        XCTAssertTrue(game?.numberOfPlayers == 1)
    }

    
// MOVE TO PLAYER TESTS
//    func test_defaultPlayerNames() {
//        let players = game.players
//
//        XCTAssertEqual(players.count, 3)
//        for i in 0..<players.count {
//            XCTAssertEqual(players[i].name, "Player \(i+1)")
//        }
//    }
        
    

    
}
