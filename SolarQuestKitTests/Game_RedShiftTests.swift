import XCTest
@testable import SolarQuest

final class Game_RedShiftTests: XCTestCase {
    
    var game : Game!
    
    override func setUp() {
        game = Game(numberOfPlayers: 3)
    }
    
    //MARK: Red Shift
    func test_rollDoubleOnes_redShift() {
        let result = game.roll(1,1)
        
        XCTAssertTrue(result.contains( .redShift ))
    }
    func test_rollDoubleTwos_redShift() {
        let result = game.roll(2,2)
        
        XCTAssertTrue(result.contains( .redShift ))
    }
    func test_rollDoubleThrees_redShift() {
        let result = game.roll(3,3)
        
        XCTAssertTrue(result.contains( .redShift ))
    }
    func test_rollDoubleFours_redShift() {
        let result = game.roll(4,4)
        
        XCTAssertTrue(result.contains( .redShift ))
    }
    func test_rollDoubleFives_redShift() {
        let result = game.roll(5,5)
        
        XCTAssertTrue(result.contains( .redShift ))
    }
    func test_rollDoubleSixes_redShift() {
        let result = game.roll(6,6)
        
        XCTAssertTrue(result.contains( .redShift ))
    }
    func test_meteorShowerRedShiftCard_dontMoveUse3HydronsCannotRollAgain() {
        let board = StandardBoard()
        let cards = [RedShiftCardDeck.MeteorShower()]
        game = Game(numberOfPlayers: 3, board: board, redShiftCards: cards)
        let originalPosition = game.boardPositionOfCurrentPlayer()
        
        let result = game.roll(6,6)
        
        XCTAssertTrue(result.contains(.redShift))
        XCTAssertTrue(result.contains(.moved(to: originalPosition, fuelCost: 3)))
        
        XCTAssertEqual(game.currentPlayer, 1)
        XCTAssertEqual(game.boardPositionOfCurrentPlayer(), 0)
        XCTAssertEqual(game.fuelForCurrentPlayer(), 22)
        XCTAssertEqual(game.state.currentPlayerCanRoll, false)
    }
    func test_redShiftCard_gotoFedStation2() {
        let board = StandardBoard()
        let cards = [RedShiftCardDeck.GoTo(position: 13, fuelCost: 2)]
        game = Game(numberOfPlayers: 3, board: board, redShiftCards: cards)

        let result = game.roll(6,6)
        
        XCTAssertTrue(result.contains(.redShift))
        XCTAssertTrue(result.contains(.message("Go To Federation Station II, use 2 hydrons of fuel.")))
        XCTAssertTrue(result.contains(.moved(to: 13, fuelCost: 2)))
        
        XCTAssertEqual(game.boardPositionOfCurrentPlayer(), 13)
        XCTAssertEqual(game.fuelForCurrentPlayer(), 23)
    }
    func test_secondRedShiftCardOfGame_gotoFedStation2() {
        let cards = [
            RedShiftCardDeck.MeteorShower(),
            RedShiftCardDeck.GoTo(position: 13, fuelCost: 2)
        ]
        let board = StandardBoard()
        game = Game(numberOfPlayers: 3, board: board, redShiftCards: cards)
        game.state.nextRedShiftCard = 1
        game.state.currentPlayerIndex = 1 // Player 2
        
        let result = game.roll(6,6)
        
        XCTAssertTrue(result.contains(.redShift))
        XCTAssertTrue(result.contains(.message("Go To Federation Station II, use 2 hydrons of fuel.")))
        XCTAssertTrue(result.contains(.moved(to: 13, fuelCost: 2)))
    }
    func test_redShiftCardForcesUseOfMoreFuelThanAvailable_outOfTheGame() {
        let cards = [
            RedShiftCardDeck.GoTo(position: 13, fuelCost: 2)
        ]
        let board = StandardBoard()
        game = Game(numberOfPlayers: 3, board: board, redShiftCards: cards)
        game.state.players[0].hydrons = 1
        
        let result = game.roll(6,6)
        
        XCTAssertTrue(result.contains(.redShift))
        XCTAssertTrue(result.contains(.message("Go To Federation Station II, use 2 hydrons of fuel.")))
        XCTAssertFalse(result.contains(.moved(to: 13, fuelCost: 2)))
        XCTAssertTrue(result.contains(.outOfTheGame))
        XCTAssertEqual(game.state.players[0].status, .outOfTheGame)
    }
}
