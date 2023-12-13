//
//  MoveManager.swift
//  SolarQuest
//
//  Created by Michael Heinz on 3/25/21.
//

import Foundation

struct MoveManager {
    
    func moveCurrentPlayerTo(_ index: Int, on board: Board, state: GameState) -> GameState {
        guard index >= 0, index < board.locations.count else {return state}
        var new = state
        new.playerLocations[new.currentPlayerIndex] = index
        return new
    }

    func movePlayer(_ n: Int, to loc: Int, on board: Board, state: GameState) -> GameState {
        let playerIndex = n-1
        guard isValid(playerIndex: playerIndex, state: state) else {
            return state
        }
        guard isValid(locationIndex: loc, board: board) else {
            return state
        }
        var new = state
        new.playerLocations[playerIndex] = loc
        return new
    }
    
    func endTurn(state: GameState) -> GameState {
        var next = state.currentPlayerIndex + 1
        if next > state.numberOfPlayers {
            next = 0
        }
        
        var new = state
        new.currentPlayerIndex = next
        new.currentPlayerCanRoll = true
        
        return state
    }


    private func isValid(playerIndex: Int, state: GameState) -> Bool {
        return playerIndex >= 0 && playerIndex < state.numberOfPlayers
    }
    private func isValid(locationIndex: Int, board: Board) -> Bool {
        return locationIndex >= 0 && locationIndex < board.locations.count
    }

}
