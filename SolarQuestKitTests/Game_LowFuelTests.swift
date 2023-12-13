import XCTest
@testable import SolarQuest

final class Game_LowFuelTests: XCTestCase {
        
    var game : Game!
    
    override func setUp() {
        game = Game(numberOfPlayers: 3)
    }

    // Landing with low fuel on an owned planet or moon without a fuel station allows player to buy property at deed price without owing rent

}
