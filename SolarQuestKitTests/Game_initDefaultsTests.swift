import XCTest
@testable import SolarQuest

class Game_initDefaultsTests: XCTestCase {

    var game: Game!
    
    override func setUpWithError() throws {
        if let game = Game(numberOfPlayers: 2) {
            self.game = game
        } else {
            assert(false)
        }
    }
    
    func testGame_newGame_hasBoard() {
        let board = TestBoard()
        let game = Game(numberOfPlayers: 2, board: board)
        let test = game?.board as? TestBoard
        XCTAssertEqual(test, board)
    }


}
