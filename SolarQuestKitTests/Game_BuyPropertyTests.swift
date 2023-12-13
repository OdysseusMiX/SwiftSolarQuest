import XCTest
@testable import SolarQuest

final class Game_BuyPropertyTests: XCTestCase {
        
    var game : Game!
    let locations = StandardBoard().locations
    
    override func setUp() {
        game = Game(numberOfPlayers: 3)
    }

    func test_getPriceOfMercury_returns375() {
        let loc = game.locationForBoardPosition(4)
        
        XCTAssertEqual(loc?.name, "Mercury")
        XCTAssertEqual(loc?.price, 375)
    }
    func test_getPriceOfIo_returns230() {
        let loc = game.locationForBoardPosition(8)
        
        XCTAssertEqual(loc?.name, "Io")
        XCTAssertEqual(loc?.price, 230)
    }

    func test_isForSale_Mercury_true() {
        game.board.place(player: 1, at: 4)
        XCTAssertEqual(game.currentLocationIsForSale(), true)
    }
    func test_buyMercury_isOwnedBySelf() {
        game.board.place(player: 1, at: 4)
        
        let success = game.buyProperty()
        
        XCTAssertEqual(success, true)
        XCTAssertEqual(game.state.ownerList[4], 1)
    }
    func test_buyMercury_payBank() {
        game.board.place(player: 1, at: 4)
        let federonsBefore = game.players[0].federons
        let costToBuy = 375
        XCTAssertEqual(game.state.ownerList[4], 0)

        let success = game.buyProperty()
        
        XCTAssertEqual(success, true)
        XCTAssertEqual(game.state.ownerList[4], 1)
        XCTAssertEqual(game.federonsForCurrentPlayer(), federonsBefore - costToBuy)
    }
    func test_isForSale_Moon_true() {
        game.board.place(player: 1, at: 2)
        XCTAssertEqual(game.currentLocationIsForSale(), true)
    }
    func test_isForSale_JupiterResearchLab_true() {
        game.board.place(player: 1, at: 18)
        XCTAssertEqual(game.currentLocationIsForSale(), true)
    }
    func test_isForSale_JupiterSpaceDock_true() {
        game.board.place(player: 1, at: 9)
        XCTAssertEqual(game.currentLocationIsForSale(), true)
    }
    func test_isForSale_Earth_false() {
        XCTAssertEqual(game.currentLocationIsForSale(), false)
    }
    func test_isForSale_BlueDot_false() {
        game.board.place(player: 1, at: 6)
        XCTAssertEqual(game.currentLocationIsForSale(), false)
    }
    func test_isForSale_OrbitalBlueDot_false() {
        game.board.place(player: 1, at: 10)
        XCTAssertEqual(game.currentLocationIsForSale(), false)
    }
    func test_isForSale_BlackDot_false() {
        game.board.place(player: 1, at: 1)
        XCTAssertEqual(game.currentLocationIsForSale(), false)
    }
    func test_isForSale_FederationStation_false() {
        game.board.place(player: 1, at: 13)
        XCTAssertEqual(game.currentLocationIsForSale(), false)
    }
    func test_tryToBuyMercuryWithInsufficientFund_false() {
        game.board.place(player: 1, at: 4)
        game.players[0].federons = 100
        
        let success = game.buyProperty()
        
        XCTAssertEqual(success, false)
        XCTAssertEqual(game.state.ownerList[4], 0)
        XCTAssertEqual(game.federonsForCurrentPlayer(), 100)
    }
    func test_mercuryOwnedByPlayer2_player1CannotBuy() {
        game.state.ownerList[4] = 2
        game.board.place(player: 1, at: 4)
        XCTAssertEqual(game.boardPositionOfPlayer(1), 4)
        
        let success = game.buyProperty()
        
        XCTAssertEqual(success, false)
        XCTAssertEqual(game.state.ownerList[4], 2)
    }
    func test_player1BuysMercury_player2BuysSolarSpaceDock() {
        let federonsAtStart = game.federonsForCurrentPlayer()
        
        let _ = game.roll(3, 1)
        let mercury = game.locationForCurrentPlayer()
        let _ = game.buyProperty()
        let _ = game.endTurn()
        
        let _ = game.roll(2, 1)
        let SSD = game.locationForCurrentPlayer()
        let _ = game.buyProperty()
        let _ = game.endTurn()
        
        XCTAssertEqual(game.players[0].federons, federonsAtStart - mercury.price!)
        XCTAssertEqual(game.players[1].federons, federonsAtStart - SSD.price!)
        XCTAssertEqual(game.state.ownerList[4], 1)
        XCTAssertEqual(game.state.ownerList[3], 2)
    }
    // can buy an unowned planet or moon with a fuel station on it for 500 plus deed price
    
    // can sell a property back to the Federation for deed price
    // can sell a property with fuel station on it back to Federation for deed price plus 500
    // cannot sell a property you don't own
}
