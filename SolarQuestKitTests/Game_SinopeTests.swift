import XCTest
@testable import SolarQuest

final class Game_SinopeTests: XCTestCase {
    
    var game : Game!
    let locations = StandardMap.createLocations()
    
    override func setUp() {
        game = Game(numberOfPlayers: 3)
    }
    
    
    // Landing on Sinope allows player to choose between landing on Sinope or Jupiter Research Lab
    // Choosing to land on Jupiter Research Lab does not incur rent at Sinope
    
}
