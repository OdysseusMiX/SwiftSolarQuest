//
//  BoardLayout.swift
//  SolarQuest_GameplayKit
//
//  Created by Michael Heinz on 3/14/21.
//

import UIKit

struct BoardLayout {
    
    let locations : [BoardLayout.Info]

    struct Info {
        let imageName : String
        let position : CGPoint
        let next : [Int]
    }
    
    init() {
        let locations = [
            BoardLayout.Info(imageName: "earth", position: CGPoint(x: 0, y: 320), next: [1]),
            BoardLayout.Info(imageName: "mars", position: CGPoint(x: 0, y: -320), next: [0]),
        ]
        self.init(locations: locations)
    }
    init(locations: [BoardLayout.Info]) {
        self.locations = locations
    }

    func findMovesFor(amountToMove n: Int, from: Int) -> [[Int]] {
        guard from < self.locations.count, n > 0 else {
            return []
        }
        
        let next = self.locations[from].next
        
        var result = [[Int]]()
        
        for nextIndex in next {
            
            let routes = self.findMovesFor(amountToMove: n-1, from: nextIndex)
            
            if routes.count > 0 {
                for route in routes {
                    var temp : [Int] = route.reversed()
                    temp.append(nextIndex)
                    result.append( temp.reversed() )
                }
            } else {
                result.append([nextIndex])
            }
            
        }
        return result        
    }
    
}


