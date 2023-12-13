import XCTest
@testable import SolarQuest

final class Game_StartBonusTests: XCTestCase {
        
    var game : Game!
    let locations = StandardMap.createLocations()
    
    override func setUp() {
        game = Game(numberOfPlayers: 3)
    }
 

    func test_passEarth_collect500() {
        game.board.place(player: 1, at: game.board.locations.count-1)
        let cashBefore = game.players[0].federons
        
        let _ = game.roll(3, 1)
        
        XCTAssertEqual(game.players[0].federons, cashBefore+500)
    }
    func test_landOnStartDirectly_collect1000() {
        game.board.place(player: 1, at: game.board.locations.count-3)
        let cashBefore = game.players[0].federons
        
        let _ = game.roll(2, 1)
        
        XCTAssertEqual(game.players[0].federons, cashBefore+1000)

    }
    func test_landOnStartViaGravityWell_collect1000() {
        game.board.place(player: 1, at: game.board.locations.count-3)
        let cashBefore = game.players[0].federons
        
        let _ = game.roll(3, 1)
        
        XCTAssertEqual(game.players[0].federons, cashBefore+1000)

    }
    func test_blastOffFromEarth_doNotCollectAnyMoney() {
        let cashBefore = game.players[0].federons
        
        let _ = game.roll(3, 1)
        
        XCTAssertEqual(game.players[0].federons, cashBefore)
    }
    func test_haveToStayOnEarthForMove_doNotCollectAnyMoney() {
        let cashBefore = game.players[0].federons
        game.players[0].hydrons = 3
        
        let _ = game.roll(3, 4)
        
        XCTAssertEqual(game.boardPositionOfCurrentPlayer(), 0)
        XCTAssertEqual(game.players[0].federons, cashBefore)
    }
    func test_didNotPassEarth_doNotCollectAnyMoney() {
        game.board.place(player: 1, at: 2)
        let cashBefore = game.players[0].federons
        
        let _ = game.roll(3, 1)
        
        XCTAssertEqual(game.players[0].federons, cashBefore)
    }
    func test_wrapAroundWithinAnOrbit_doNotCollectAnyMoney() {
        game.board.place(player: 1, at: 21)
        let cashBefore = game.players[0].federons
        
        let _ = game.roll(2, 1)
        
        XCTAssertEqual(game.players[0].federons, cashBefore)
    }


}

