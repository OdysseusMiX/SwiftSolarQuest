
import SpriteKit
import GameplayKit

class BoardScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()

    var game : Game!
    var state : GameState! {self.game?.state}
    var layout : BoardLayout!

    private var lastUpdateTime : TimeInterval = 0
    private var ignoreTouches = false
    
    override func sceneDidLoad() {

        self.lastUpdateTime = 0
        
        self.newGame()
        
        self.createAllFromState()
    }
    
    fileprivate func newGame() {
        self.game = Game(numberOfPlayers: 1)
        self.layout = BoardLayout()
    }
    
    func createAllFromState() {
        
        let locations = self.layout.locations
        
        for location in locations {
            let name = location.imageName
            let position = location.position
            let entity = CelestialBody(imageName: name, position: position)
            self.entities.append(entity)
            if let node = entity.component(ofType: SpriteComponent.self)?.node {
                self.addChild(node)
            }
        }
        
        for (number,location) in self.state.playerLocations.enumerated() {
            let position = locations[location].position
            let player = Spaceship(playerNumber: number, imageName: "red_spaceship", position: position)
            self.entities.append(player)
            if let node = player.component(ofType: SpriteComponent.self)?.node {
                self.addChild(node)
            }
        }
    }
    
    func getPlayerEntity(_ number: Int) -> GKEntity? {
      for entity in entities {
        if let playerComponent = entity.component(ofType: PlayerComponent.self) {
          if playerComponent.number == number {
            return entity
          }
        }
      }
      return nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !ignoreTouches else {return}
        ignoreTouches = true
        self.moveCurrentPlayerToNext()
    }
    
    func moveCurrentPlayerToNext() {
        let currentLocation = self.state.playerLocations[self.state.currentPlayer]
        let routes = self.layout.findMovesFor(amountToMove: 1, from: currentLocation)
        let newLocation = routes[0][0]
        let newPosition = self.layout.locations[newLocation].position
        
        self.game.moveCurrentPlayerTo(newLocation)
        
        if let player = self.getPlayerEntity(self.state.currentPlayer),
           let node = player.component(ofType: SpriteComponent.self)?.node {
            
            let actionMove = SKAction.move(to: newPosition, duration: 0.5)
            let resume = SKAction.perform(#selector(self.allowTouches), onTarget: self)
            
            node.run(SKAction.sequence([actionMove, resume]))
        }
    }
    
    @objc func allowTouches() {
        self.ignoreTouches = false
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
}
