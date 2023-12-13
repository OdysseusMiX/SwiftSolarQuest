import XCTest
@testable import SolarQuest

final class Game_MoveTests: XCTestCase {
        
    var game : Game!
    var locations : [Location]!
    
    override func setUp() {
        GameFactory.version = .standard
        game = GameFactory.newGame(numberOfPlayers: 3)
        locations = game.board.locations
    }

    func test_playersStartAtFirstLocation() {
        let firstLocation = locations.first

        XCTAssertEqual(game.locationForPlayer(1), firstLocation)
        XCTAssertEqual(game.locationForPlayer(2), firstLocation)
        XCTAssertEqual(game.locationForPlayer(3), firstLocation)
    }
    
    func test_player1MovesThree_atFourthLocation() {
        let _ = game.roll(1,2)

        XCTAssertEqual(game.locationForCurrentPlayer(), locations[3])
    }
    
    // TODO: MOVE TO TURN TESTS
    func test_turnIsPlayer2WhenPlayer1EndsTurn() {
        let _ = game.roll(1,2)
        let _ = game.endTurn()

        XCTAssertEqual(game.currentPlayer, 2)
    }

    func test_player1MovesTwoPlayer2MovesThree_player2AtFourthLocation() {
        let _ = game.roll(1,5)
        let _ = game.endTurn()
        let _ = game.roll(1,2)

        XCTAssertEqual(game.locationForCurrentPlayer(), locations[3])
    }

    func test_turnIsBackToPlayer1WhenPlayer2IsFinished() throws {
        game = Game(numberOfPlayers: 2)

        let _ = game.roll(1,2)
        let _ = game.endTurn()
        let _ = game.roll(1,2)
        let _ = game.endTurn()

        XCTAssertEqual(game.currentPlayer, 1)
    }

    func test_playerPositionWraps() throws {
        let endOfBoard = game.board.locations.count - 1
        game.board.place(player: 1, at: endOfBoard )

        let _ = game.roll(1,2)

        XCTAssertEqual(game.locationForPlayer(1), locations[2])
    }
    
    func test_playerMovesSevenFromFedStationVIII_atTriton() throws {
        guard let fedStation8 = game.board.locations.firstIndex (where: { (loc) -> Bool in
            loc.name == "Federation Station VIII"
        }) else {XCTFail(); return}

        game.board.place(player: 1, at: fedStation8 )

        let _ = game.roll(3,4)

        XCTAssertEqual(game.locationForPlayer(1)?.name, "Triton")

    }
    func test_playerCannotBreakOrbitIfWouldLandOnBlackDot() throws {
        // Given player is on Triton
        guard let triton = game.board.locations.firstIndex (where: { (loc) -> Bool in
            loc.name == "Triton"
        }) else {XCTFail(); return}
        game.board.place(player: 1, at: triton )

        // When player moves 4
        let _ = game.roll(3,1)

        // Then player does not break orbit and lands on Nereid
        XCTAssertEqual(game.locationForPlayer(1)?.name, "Nereid")

    }
    func test_playerBreakOrbitIfWouldNotLandOnBlackDot() throws {
        // Given player is on Triton
        guard let triton = game.board.locations.firstIndex (where: { (loc) -> Bool in
            loc.name == "Triton"
        }) else {XCTFail(); return}
        game.board.place(player: 1, at: triton )

        // When player moves 6
        let _ = game.roll(5,1)

        // Then player breaks orbit and lands on Earth Research Station
        XCTAssertEqual(game.locationForPlayer(1)?.name, "Earth Research Lab")

    }
    func test_playerBreaksOrbitAndLandsOnEarth() throws {
        // Given player is on Triton
        guard let triton = game.board.locations.firstIndex (where: { (loc) -> Bool in
            loc.name == "Triton"
        }) else {XCTFail(); return}
        game.board.place(player: 1, at: triton )

        // When player moves 7
        let _ = game.roll(5,2)

        // Then player breaks orbit and lands on Earth
        XCTAssertEqual(game.locationForPlayer(1)?.name, "Earth")

    }
    func test_playerBreaksOrbitAndLandsOnBlackDotBeyondEarth_atEarth() throws {
        // Given player is on Triton
        guard let triton = game.board.locations.firstIndex (where: { (loc) -> Bool in
            loc.name == "Triton"
        }) else {XCTFail(); return}
        game.board.place(player: 1, at: triton )

        // When player moves 8
        let _ = game.roll(5,3)

        // Then player breaks orbit and lands on Earth
        XCTAssertEqual(game.locationForPlayer(1)?.name, "Earth")

    }
    func test_playerLandsOnBlackDotBeyondEarth_atEarth() throws {
        // Given player is two space before Earth
        game.board.place(player: 1, at: game.board.locations.count-2 )

        // When player moves 3
        let _ = game.roll(1,2)

        // Then player gets pulled back and lands on Earth
        XCTAssertEqual(game.locationForPlayer(1)?.name, "Earth")

    }
    
}
