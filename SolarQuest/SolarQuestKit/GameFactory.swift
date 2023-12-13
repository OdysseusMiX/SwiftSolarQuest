//
//  GameFactory.swift
//  SolarQuest
//
//  Created by Michael Heinz on 3/18/21.
//

import Foundation

struct GameFactory {
    
    enum GameVersion {
        case test
        case standard
    }
    
    static var version: GameVersion = .standard
    
    static func newGame(numberOfPlayers n: Int) -> Game? {
        let board : Board = {
            switch GameFactory.version {
            case .standard:
                return StandardBoard()
            case .test:
                return TestBoard()
            }
        }()
        
        return Game(numberOfPlayers: n, board: board)
    }
}
