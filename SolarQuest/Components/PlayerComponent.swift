//
//  PlayerComponent.swift
//  SolarQuest_GameplayKit
//
//  Created by Michael Heinz on 3/10/21.
//

import SpriteKit
import GameplayKit

class PlayerComponent: GKComponent {
    
    let number: Int
    
    init(number: Int) {
        self.number = number
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
