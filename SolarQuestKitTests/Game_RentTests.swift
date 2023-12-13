import XCTest
@testable import SolarQuest

final class Game_RentTests: XCTestCase {
    
    var game : Game!
    
    override func setUp() {
        game = Game(numberOfPlayers: 3)
        game.state.ownerList[2] = 1 // Moon
        game.state.ownerList[3] = 2 // Solar Space Dock
        game.state.ownerList[4] = 3 // Mercury
    }
    
    func test_landOnMercuryOwnedByOtherPlayer_oweRent() {
        let result = game.roll(3, 1) // go to Mercury
        
        XCTAssertEqual(result.contains( .owe(player:3, 1035) ), true)
        XCTAssertEqual(game.state.players[0].debt, [Player.IOU(owe: 1035, toPlayer: 3)])
    }
    func test_landOnSolarSDOwnedByOtherPlayer_oweRent() {
        game.state.currentPlayerIndex = 2 // Player 3
        let result = game.roll(2, 1) // go to Solar Space Dock
        
        XCTAssertEqual(result.contains( .owe(player:2, 75) ), true)
        XCTAssertEqual(game.state.players[2].debt, [Player.IOU(owe: 75, toPlayer: 2)])
    }
    func test_payRentOwed_debtIsPaid() {
        let _ = game.roll(3, 1) // go to Mercury
        let startedWith = game.state.players[0].federons
        
        let success = game.pay(1035, toPlayer: 3)
        
        XCTAssertEqual(success, true)
        XCTAssertEqual(game.state.players[0].debt, [])
        XCTAssertEqual(game.state.players[0].federons, startedWith - 1035)
        XCTAssertEqual(game.state.players[2].federons, startedWith + 1035)
    }
    
    func test_endTurnWithDebt_cannnotEndTurn() {
        let _ = game.roll(3, 1) // go to Mercury

        let success = game.endTurn()
        
        XCTAssertEqual(success, false)
        XCTAssertEqual(game.currentPlayer, 1)
    }
    
    // Declaring bankruptcy results in player being out of the game
    // Rent is based on number of properties owned within the property group
    // Rent is due once per turn
    
}
