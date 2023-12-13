//
//  GameState.swift
//  SolarQuest_GameplayKit
//
//  Created by Michael Heinz on 3/14/21.
//

import Foundation

struct GameState {
    
    var playerLocations : [Int]
    var currentPlayer : Int
    var ownerList : [Int]
    var placedFuelStationLocations : Set<Int>

    var numberOfPlayers : Int {self.playerLocations.count}

    init() {
        let ownerList = Array.init(repeating: 0, count: 2)
        self.init(playerLocations: [0], currentPlayer: 0, ownerList: ownerList, placedFuelStationLocations: [])
    }
    init(for board: Board, numberOfPlayers n: Int) {
        let pos = Array.init(repeating: 0, count: n)
        let ownerList = Array.init(repeating: 0, count: board.locations.count)
        self.init(playerLocations: pos, currentPlayer: 0, ownerList: ownerList, placedFuelStationLocations: [])
    }
    init(playerLocations: [Int], currentPlayer: Int, ownerList: [Int], placedFuelStationLocations: Set<Int>) {
        
        self.playerLocations = playerLocations
        self.currentPlayer = currentPlayer
        self.ownerList = ownerList
        self.placedFuelStationLocations = placedFuelStationLocations
    }

}
