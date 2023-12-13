
import XCTest
@testable import SolarQuest

class GameStateTests: XCTestCase {

    func testGame_newGame_hasPlayerPostions() {
        let game = GameFactory.newGame(numberOfPlayers: 2)
        let test = game?.state.playerLocations
        XCTAssertEqual(test?.count, 2)
        XCTAssertEqual(test?.first, 0)
        XCTAssertEqual(test?.last, 0)
    }

    func testGame_newGame_hasPropertyOwnersList() {
        let game = GameFactory.newGame(numberOfPlayers: 2)
        let totalProperties = game?.locations.count
        let test = game?.state.ownerList
        
        XCTAssertEqual(test?.count, totalProperties)
        if let test = test {
            for loc in test {
                XCTAssertEqual(loc, 0)
            }
        } else {
            XCTFail("ownerList was nil")
        }
    }

    func testGame_newGame_hasPlacedFuelStationsList() {
        if let game = GameFactory.newGame(numberOfPlayers: 2) {
            let test : Set<Int> = game.state.placedFuelStationLocations
            
            XCTAssertEqual(test.count, 0)
        } else {
            XCTFail("Did not create game")
        }
    }
    
    func testGame_placeFuelStation_updatesState() {
        GameFactory.version = .standard
        if let game = GameFactory.newGame(numberOfPlayers: 2) {
            
            game.state.currentPlayerIndex = 0 // Player 1
            game.state.ownerList[4] = 1
            
            let success = game.placeFuelStation(at: 4)
            
            XCTAssertTrue(success)
            XCTAssertTrue(game.state.placedFuelStationLocations.contains(4))
            
        } else {
            XCTFail("Did not create game")
        }
    }
    func testGame_placeFuelStationAtUnownedLocation_fail() {
        GameFactory.version = .standard
        if let game = GameFactory.newGame(numberOfPlayers: 2) {
            
            game.state.currentPlayerIndex = 0 // Player 1
            game.state.ownerList[4] = 0
            
            let success = game.placeFuelStation(at: 4)
            
            XCTAssertFalse(success)
            XCTAssertFalse(game.state.placedFuelStationLocations.contains(4))
            
        } else {
            XCTFail("Did not create game")
        }
    }
}
