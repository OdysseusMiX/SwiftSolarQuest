//
//  planetEntity.swift
//  SolarQuest_GameplayKit
//
//  Created by Michael Heinz on 3/10/21.
//

import SpriteKit
import GameplayKit

class CelestialBody: GKEntity {
    
    init(imageName: String, position: CGPoint) {
        super.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        spriteComponent.node.position = position
        addComponent(spriteComponent)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
