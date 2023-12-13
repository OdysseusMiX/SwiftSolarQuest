//
//  GameState.swift
//  SolarQuest_GameplayKit
//
//  Created by Michael Heinz on 3/14/21.
//

import Foundation

struct GameState {
    
    var playerLocations : [Int]
    var currentPlayerIndex : Int
    var ownerList : [Int]
    var placedFuelStationLocations : Set<Int>

    var numberOfPlayers : Int {self.playerLocations.count}

    init(for board: Board, numberOfPlayers n: Int) {
        let pos = Array.init(repeating: 0, count: n)
        let ownerList = Array.init(repeating: 0, count: board.locations.count)
        
        self.playerLocations = pos
        self.currentPlayerIndex = 0
        self.ownerList = ownerList
        self.placedFuelStationLocations = []
    }
}
