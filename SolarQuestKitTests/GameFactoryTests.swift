import XCTest
@testable import SolarQuest

class GameFactoryTests: XCTestCase {

    override func setUp() {
        GameFactory.version = .standard
    }
    
    func testGameFactory_newGame_createsGame() {
        let game = GameFactory.newGame(numberOfPlayers: 2)
        
        if let game = game {
            XCTAssertEqual(game.numberOfPlayers, 2)
        } else {
            XCTFail("Did not create a new game")
        }
    }
    
    func testGameFactory_testVersion_newGame_createsGame() {
        GameFactory.version = .test
        let game = GameFactory.newGame(numberOfPlayers: 2)
        
        if let game = game {
            XCTAssertEqual(game.numberOfPlayers, 2)
        } else {
            XCTFail("Did not create a new game")
        }
    }
    
    func testGameFactory_newGame_createsGameWithStandardBoard() {
        let game = GameFactory.newGame(numberOfPlayers: 2)
        let test = game?.board as? StandardBoard
        
        XCTAssertNotNil(test)
    }

    func testGameFactory_testVersion_newGame_createsGameWithTestBoard() {
        GameFactory.version = .test
        let game = GameFactory.newGame(numberOfPlayers: 2)
        let test = game?.board as? TestBoard
        
        XCTAssertNotNil(test)
    }

    }
