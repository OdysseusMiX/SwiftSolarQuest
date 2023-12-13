//
//  DeedManager.swift
//  SolarQuest
//
//  Created by Michael Heinz on 3/25/21.
//

import Foundation

struct Banker {
    enum BuyError: Error {
        case notBuyable
        case notUnowned
        case insufficientFunds
        case invalidInput
    }
    
    func buyProperty(state: GameState, board: Board) throws -> GameState {
        let playerIndex = state.currentPlayerIndex
        guard playerIndex >= 0, playerIndex < state.playerLocations.count else {
            throw BuyError.invalidInput
        }
        let locationIndex = state.playerLocations[playerIndex]
        guard locationIndex >= 0, locationIndex < board.locations.count else {
            throw BuyError.invalidInput
        }
        
        if let price = board.locations[locationIndex].price {
            
            let isForSale = state.ownerList[locationIndex] == 0
            guard isForSale else {throw BuyError.notUnowned}
        
            let cashOnHand = state.players[playerIndex].federons
            guard price <= cashOnHand else {throw BuyError.insufficientFunds}
        
            var new = state
            new.players[playerIndex].federons -= price
            new.ownerList[locationIndex] = playerIndex + 1
            return new
            
        } else {
            throw BuyError.notBuyable
        }
    }
    
    func placeFuelStation(at pos: Int, on board: Board, state: GameState) throws -> GameState {
        guard pos >= 0,
              pos < board.locations.count,
              pos < state.ownerList.count else {
            throw BuyError.invalidInput
        }
        
        let currentPlayer = state.currentPlayerIndex + 1
        if state.ownerList[pos] == currentPlayer,
           !state.placedFuelStationLocations.contains(pos) {
            var new = state
            new.placedFuelStationLocations.insert(pos)
            return new
        } else {
            throw BuyError.invalidInput
        }
    }
    
    func totalDebtForCurrentPlayer(state: GameState) -> Int {
        let playerIndex = state.currentPlayerIndex
        return state.players[playerIndex].debt.reduce(0) { (sum, iou) -> Int in
            return sum + iou.owe
        }
    }

}
