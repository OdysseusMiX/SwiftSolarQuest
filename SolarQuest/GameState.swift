//
//  GameState.swift
//  SolarQuest_GameplayKit
//
//  Created by Michael Heinz on 3/14/21.
//

import Foundation

struct GameState {
    
    let layout : BoardLayout
    var playerLocations : [Int]
    var currentPlayer : Int

    var numberOfPlayers : Int {self.playerLocations.count}

    init() {
        self.init(layout: BoardLayout(), playerLocations: [0], currentPlayer: 0)
    }
    init(layout: BoardLayout, playerLocations: [Int], currentPlayer: Int) {
        self.layout = layout
        self.playerLocations = playerLocations
        self.currentPlayer = currentPlayer
    }

}
