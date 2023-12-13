import XCTest
@testable import SolarQuest

final class Game_RollTests: XCTestCase {
        
    var game : Game!
    let locations = StandardMap.listLocations(in: StandardMap.createMap())
    
    override func setUp() {
        game = Game(numberOfPlayers: 3)
    }
 
    func test_BeforeFirstRoll_canRollIsTrue() {
        XCTAssertEqual(game.canRoll, true)
    }
    func test_AfterRoll_canRollIsFalse() {
        let _ = game.roll(3,1)
        XCTAssertEqual(game.canRoll, false)
    }
    func test_AfterRoll_cannotRollAgain() {
        let _ = game.roll(3,1)
        let result = game.roll(3,1)
        XCTAssertEqual(result, [.invalidRoll])
    }
    func test_AfterEndTurn_canRollIsTrueAgain() {
        let _ = game.roll(3, 1)
        let _ = game.endTurn()
        XCTAssertEqual(game.canRoll, true)
    }
    
    func test_rollMoreThan6OnEitherDie_returnsInvalidResult() {
        let result1 = game.roll(7,1)
        let result2 = game.roll(1,7)

        XCTAssertEqual(result1, [.invalidRoll])
        XCTAssertEqual(result2, [.invalidRoll])
    }
    func test_rollMLessThan1OnEitherDie_returnsInvalidResult() {
        let result1 = game.roll(0,1)
        let result2 = game.roll(1,0)

        XCTAssertEqual(result1, [.invalidRoll])
        XCTAssertEqual(result2, [.invalidRoll])
    }
    func test_rollThreeWithSufficientFuel_returnsMovedThree() {
        let result = game.roll(1,2)
        
        XCTAssertEqual(result, [.moved(to: 3, fuelCost: 3)])
    }
    func test_roll4With5HydronsAndLandOnPlanet_returnsMoved4AndStranded() {
        game.players[0].hydrons = 5
        
        let result = game.roll(1,3)
        
        XCTAssertTrue(result.contains(.moved(to: 4, fuelCost: 4)))
        XCTAssertTrue(result.contains(.stranded))
    }
    func test_roll4With4HydronsAndLandOnPlanet_returnsMoved4AndStranded() {
        game.players[0].hydrons = 4
        
        let result = game.roll(1,3)
        
        XCTAssertTrue(result.contains(.moved(to: 4, fuelCost: 4)))
        XCTAssertTrue(result.contains(.stranded))
    }
    func test_roll8AndLandOnMoonWith1Hydron_returnsMoved8AndStranded() {
        game.players[0].hydrons = 9
        
        let result = game.roll(5,3)
        
        XCTAssertTrue(result.contains(.moved(to: 8, fuelCost: 8)))
        XCTAssertTrue(result.contains(.stranded))
    }
    func test_landOnMoonWith1HydronAndNoFuelStations_outOfTheGame() {
        game.players[0].hydrons = 9
        game.players[0].unplacedFuelStations = 0
        game.board.oldLocations[8].hasFuel = false
        
        let result = game.roll(5,3) // moves to Io
        
        XCTAssertTrue(result.contains(.outOfTheGame))
        XCTAssertEqual(game.players[0].status, .outOfTheGame)
    }
    func test_landOnBlueDotWith1Hydron_notStranded() {
        game.players[0].hydrons = 7
        
        let result = game.roll(5,2) // moves to Blue Dot prior to Jupiter orbit
        
        XCTAssertEqual(game.locationOfCurrentPlayer(), StandardMap.BlueDot())
        XCTAssertEqual(game.players[0].status, .playing)
        XCTAssertFalse(result.contains(.stranded))
    }
    func test_landOnOrbitalBlueDotWith1Hydron_notStranded() {
        game.players[0].hydrons = 10
        
        let result = game.roll(6,4) // moves to first Blue Dot in Jupiter orbit
        
        XCTAssertEqual(game.locationOfCurrentPlayer(), StandardMap.OrbitalBlueDot())
        XCTAssertEqual(game.players[0].status, .playing)
        XCTAssertFalse(result.contains(.stranded))
    }
    func test_landOnSpaceDockWith1Hydron_notStranded() {
        game.players[0].hydrons = 9
        
        let result = game.roll(5,4) // moves to Jupiter space dock
        
        XCTAssertEqual(game.locationOfCurrentPlayer(), StandardMap.JupiterSpaceDock())
        XCTAssertEqual(game.players[0].status, .playing)
        XCTAssertFalse(result.contains(.stranded))
    }
}
