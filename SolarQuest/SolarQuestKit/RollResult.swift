//
//  RollResult.swift
//  SolarQuest
//
//  Created by Michael Heinz on 3/23/21.
//

import Foundation

enum RollResult : Equatable {
    case invalidRoll
    case moved(Int)
    case moved(to: Int, fuelCost: Int)
    case owe(player: Int, Int)
    case stranded
    case redShift
    case message(String)
    case loseTurn
    case outOfTheGame
}
