import XCTest
@testable import SolarQuest

final class GameTests: XCTestCase {
        
    var game : Game!
    let locations = StandardMap.createLocations()
    
    override func setUp() {
        game = Game(numberOfPlayers: 3)
    }

    
    func test_newGameHasBoardWithSameNumberOfPlayers() {
        XCTAssertEqual(game.numberOfPlayers, 3)
        XCTAssertEqual(game.board.numberOfPlayers, 3)
    }
    
    func test_initGameWithNoPlayers_returnsNil() {
        let game = Game(numberOfPlayers: 0)
        
        XCTAssertTrue(game == nil)
    }

    func test_defaultPlayerNames() {
        let players = game.players
        
        XCTAssertEqual(players.count, 3)
        for i in 0..<players.count {
            XCTAssertEqual(players[i].name, "Player \(i+1)")
        }
    }
        
    

    
}
