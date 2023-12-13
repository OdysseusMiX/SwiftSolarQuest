//
//  Board.swift
//  SolarQuest
//
//  Created by Michael Heinz on 3/18/21.
//

import Foundation

protocol Board {
    var locations : [Location] {get}
    var connections: [[Int]] {get}
}
