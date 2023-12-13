import XCTest
@testable import SolarQuest

class Game_initDefaultsTests: XCTestCase {
    
    func testGame_newGame_hasBoard() {
        let board = TestBoard()
        let game = Game(numberOfPlayers: 2, board: board)
        let test = game?.board as? TestBoard
        XCTAssertEqual(test, board)
    }


}
