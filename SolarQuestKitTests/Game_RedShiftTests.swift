import XCTest
@testable import SolarQuest

final class Game_RedShiftTests: XCTestCase {
    
    var game : Game!
    let locations = StandardMap.listLocations(in: StandardMap.createMap())
    
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
        let originalPosition = game.boardPositionOfCurrentPlayer()
        game.redShiftCardDeck = [RedShiftCardDeck.MeteorShower()]
        let result = game.roll(6,6)
        
        XCTAssertTrue(result.contains(.redShift))
        XCTAssertTrue(result.contains(.moved(to: originalPosition, fuelCost: 3)))
        
        XCTAssertEqual(game.currentPlayer, 1)
        XCTAssertEqual(game.boardPositionOfCurrentPlayer(), 0)
        XCTAssertEqual(game.fuelForCurrentPlayer(), 22)
        XCTAssertEqual(game.canRoll, false)
    }
    func test_redShiftCard_gotoFedStation2() {
        game.redShiftCardDeck = [RedShiftCardDeck.GoTo(position: 13, fuelCost: 2)]
        let result = game.roll(6,6)
        
        XCTAssertTrue(result.contains(.redShift))
        XCTAssertTrue(result.contains(.message("Go To Federation Station II, use 2 hydrons of fuel.")))
        XCTAssertTrue(result.contains(.moved(to: 13, fuelCost: 2)))
        
        XCTAssertEqual(game.boardPositionOfCurrentPlayer(), 13)
        XCTAssertEqual(game.fuelForCurrentPlayer(), 23)
    }
    func test_secondRedShiftCardOfGame_gotoFedStation2() {
        game.redShiftCardDeck = [
            RedShiftCardDeck.MeteorShower(),
            RedShiftCardDeck.GoTo(position: 13, fuelCost: 2)
        ]
        game.nextRedShiftCard = 1
        game.currentPlayer = 2
        
        let result = game.roll(6,6)
        
        XCTAssertTrue(result.contains(.redShift))
        XCTAssertTrue(result.contains(.message("Go To Federation Station II, use 2 hydrons of fuel.")))
        XCTAssertTrue(result.contains(.moved(to: 13, fuelCost: 2)))
    }
    func test_redShiftCardForcesUseOfMoreFuelThanAvailable_outOfTheGame() {
        game.redShiftCardDeck = [
            RedShiftCardDeck.GoTo(position: 13, fuelCost: 2)
        ]
        game.players[0].hydrons = 1
        
        let result = game.roll(6,6)
        
        XCTAssertTrue(result.contains(.redShift))
        XCTAssertTrue(result.contains(.message("Go To Federation Station II, use 2 hydrons of fuel.")))
        XCTAssertFalse(result.contains(.moved(to: 13, fuelCost: 2)))
        XCTAssertTrue(result.contains(.outOfTheGame))
        XCTAssertEqual(game.players[0].status, .outOfTheGame)
    }
}
