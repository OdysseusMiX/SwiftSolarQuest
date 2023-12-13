//
//  Spaceship.swift
//  SolarQuest_GameplayKit
//
//  Created by Michael Heinz on 3/10/21.
//

import SpriteKit
import GameplayKit

class Spaceship: GKEntity {
    
    init(playerNumber: Int, imageName: String, position: CGPoint) {
        super.init()

        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        spriteComponent.node.position = position
        self.addComponent(spriteComponent)
        
        let playerComponent = PlayerComponent(number: playerNumber)
        self.addComponent(playerComponent)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
