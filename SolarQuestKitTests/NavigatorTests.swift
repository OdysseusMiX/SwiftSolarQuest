
import XCTest
@testable import SolarQuest

class NavigatorTests: XCTestCase {

    var board : Board!
    var nav : StandardNavigator!
    
    override func setUp() {
        board = StandardBoard()
        nav = StandardNavigator(for: board)
    }
    
    func test_startLocationTooBig_emptyArray() {
        let indexOneMoreThanMax = board.locations.count
        
        let test = nav.findRouteFor(amountToMove: 3, from: indexOneMoreThanMax)
        
        XCTAssertEqual(test, [Int]() )
    }
    
    func test_startLocationTooSmall_emptyArray() {
        let test = nav.findRouteFor(amountToMove: 3, from: -1)

        XCTAssertEqual(test, [Int]() )
    }

    func test_DistanceAsBigAsMap_emptyArray() {
        let mapSize = board.locations.count
        
        let test = nav.findRouteFor(amountToMove: mapSize, from: 0)

        XCTAssertEqual(test, [])

    }
    func test_DistanceBiggerThanMap_emptyArray() {
        let mapSize = board.locations.count
        
        let test = nav.findRouteFor(amountToMove: mapSize+1, from: 0)

        XCTAssertEqual(test, [])

    }
    func test_DistanceLessThanOne_emptyArray() {
        let test = nav.findRouteFor(amountToMove: 0, from: 0)

        XCTAssertEqual(test, [])

    }

    func test_goTwoAlongPath_oneRoute() {
        let test = nav.findRouteFor(amountToMove: 2, from: 0)
        let expected = [1,2]
        
        XCTAssertEqual(test, expected)

    }
    func test_goThreeAlongPath_oneRoute() {
        let test = nav.findRouteFor(amountToMove: 3, from: 0)
        let expected = [1,2,3]
        
        XCTAssertEqual(test, expected)

    }
    func test_goThreeAlongPathFrom1_oneRoute() {
        let test = nav.findRouteFor(amountToMove: 3, from: 1)
        let expected = [2,3,4]
        
        XCTAssertEqual(test, expected)

    }
    func test_goTwoAlongPathNearEnd_wrapAround() {
        let last = board.locations.count - 1
        
        let test = nav.findRouteFor(amountToMove: 2, from: last-1)
        let expected = [last,0]
        
        XCTAssertEqual(test, expected)

    }
    
    func test_goFourFromDeimos_Venus() {
        // For a standard board:
        let deimos = 51
        let blueDot = 52
        let venusLab = 53
        let venus = 54
        let blackDot = 55
        

        let test = nav.findRouteFor(amountToMove: 4, from: deimos)
        let expected = [blueDot,venusLab,venus,blackDot,venus]
        
        XCTAssertEqual(test, expected)
    }
    func test_goFourFromEnceladus_FedStation7() {
        // For a standard board:
        let enceladus = 66
        let saturnLab = 67
        let hyperion = 68
        let blackDot1 = 71
        let blackDot2 = 72
        let titan = 69
        let fedStation7 = 70
        
        let test = nav.findRouteFor(amountToMove: 4, from: enceladus)
        let expected = [saturnLab,hyperion,blackDot1, blackDot2, blackDot1, hyperion, titan, fedStation7]
        
        XCTAssertEqual(test, expected)
    }

    func test_goThreeFromMetis_Himalia() {
        // For a standard board:
        let metis = 16
        let ganymede = 17
        let jupiterResearchLab = 18
        let Himalia = 19
        let sinope = 23
        let firstBlackDotPastSinope = 24
        
        let test = nav.findRouteFor(amountToMove: 3, from: metis)
        let expected = [ganymede,sinope,firstBlackDotPastSinope,sinope,ganymede,jupiterResearchLab,Himalia]
        
        
        XCTAssertEqual(test, expected)
    }
    
}
