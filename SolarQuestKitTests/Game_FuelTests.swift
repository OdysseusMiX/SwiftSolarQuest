import XCTest
@testable import SolarQuest

final class Game_FuelTests: XCTestCase {
        
    var game : Game!
    
    override func setUp() {
        game = Game(numberOfPlayers: 3)
    }


    func test_playersStartWith25Hydrons() {
        let players = game.state.players
        
        XCTAssertEqual(players.count, 3)
        for i in 0..<players.count {
            XCTAssertEqual(players[i].hydrons, 25)
        }
    }
    func test_player1MovesFourFromEarth_costsFourHydrons() throws {
        let fuelBefore = game.state.players[0].hydrons
        
        let _ = game.roll(1,3)

        XCTAssertEqual(game.state.players[0].hydrons, fuelBefore-4)
    }
    func test_player1MovesThreeFromMoon_costsThreeHydrons() throws {
        game.state.playerLocations[0] = 2
        let fuelBefore = game.state.players[0].hydrons
        
        let _ = game.roll(1,2)

        XCTAssertEqual(game.state.players[0].hydrons, fuelBefore-3)
    }
    func test_player2MovesThreeFromEarth_costsThreeHydrons() throws {
        game.state.currentPlayerIndex = 1 // Player 2
        let fuelBefore = game.state.players[1].hydrons
        
        let _ = game.roll(1,2)

        XCTAssertEqual(game.state.players[1].hydrons, fuelBefore-3)
    }
    func test_player1MovesThreeFromSpaceDock_noFuelCost() throws {
        game.state.playerLocations[0] = 3
        let fuelBefore = game.state.players[0].hydrons
        
        let _ = game.roll(1,3)

        XCTAssertEqual(game.state.players[0].hydrons, fuelBefore)
    }
    func test_player1MovesThreeFromBlueDot_noFuelCost() throws {
        game.state.playerLocations[0] = 6
        let fuelBefore = game.state.players[0].hydrons
        
        let _ = game.roll(1,3)

        XCTAssertEqual(game.state.players[0].hydrons, fuelBefore)
    }
    func test_player1TriesToMove10With9Hydrons_doesNotMove() throws {
        game.state.players[0].hydrons = 9
        let startingLocation = game.locationForPlayer(1)
        
        let _ = game.roll(6,4)

        XCTAssertEqual(game.locationForPlayer(1), startingLocation)
        XCTAssertEqual(game.state.players[0].hydrons, 9)
    }
    
    func test_whenOnEarth_canBuyFuelFor25PerHydronFromFederation() {
        let data = game.fuelDataForLocationOfCurrentPlayer()
        
        XCTAssertEqual(data?.rate, 25)
        XCTAssertEqual(data?.fromPlayer, 0)
    }
    func test_whenOnBlueDot_cannotBuyFuel() {
        game.state.playerLocations[0] = 6

        let data = game.fuelDataForLocationOfCurrentPlayer()
        
        XCTAssertEqual(data, nil)
    }
    func test_whenOnOrbitalBlueDot_cannotBuyFuel() {
        game.state.playerLocations[0] = 10

        let data = game.fuelDataForLocationOfCurrentPlayer()
        
        XCTAssertEqual(data, nil)
    }
    func test_whenOnUnownedSpaceDock_canBuyFuelFromFederationAtLowestRateOnDeedCard() {
        game.state.playerLocations[0] = 3

        let data = game.fuelDataForLocationOfCurrentPlayer()
        
        XCTAssertEqual(data?.rate, 10)
        XCTAssertEqual(data?.fromPlayer, 0)
    }
    func test_BuyFuel_playerIsRefueled() {
        game.state.players[0].hydrons = 20
        game.state.players[0].federons = 50
        game.state.playerLocations[0] = 3

        let success = game.buyFuel(hydrons: 5)
        
        XCTAssertEqual(success, true)
        XCTAssertEqual(game.state.players[0].hydrons, 25)
        XCTAssertEqual(game.state.players[0].federons, 0)
    }
    func test_BuyTooMuchFuel_notSuccessful() {
        game.state.players[0].hydrons = 20
        game.state.players[0].federons = 500
        game.state.playerLocations[0] = 3

        let success = game.buyFuel(hydrons: 6)
        
        XCTAssertEqual(success, false)
        XCTAssertEqual(game.state.players[0].hydrons, 20)
        XCTAssertEqual(game.state.players[0].federons, 500)
    }

    // can buy fuel from other player when on owned space dock
    // can refuel for free when on space dock owned by self
    // can refuel on planet or moon owned by self when there is a fuel station on it
    // can buy fuel from other player when on planet or moon owned by other player when there is a fuel station on it
    // fuel rate is based on number of properties in group owned, except for unowned properties
    // fuel is always available at a space dock
    // fuel is never available at a lab
    // fuel is never available at a federation station
    // fuel is never available at a blue dot
    // fuel is never available at a black dot
    // can only buy fuel from your current location
    
    // can only place fuel stations on moons or planets that you own
    // cannot place fuel station on property not owned by self
}
