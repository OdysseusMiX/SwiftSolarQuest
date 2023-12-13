struct StandardNavigator : Navigator {
    let locations: [Location]
    let connections: [[Int]]
    
    init(for board: Board) {
        locations = board.locations
        connections = board.connections
    }
    
    func nextLocation(from: Int, moving: Int) -> Int {
        let route = findRouteFor(amountToMove: moving, from: from)
        
        if let endPoint = route.last {
            return endPoint
        } else {
            return from
        }
    }
    
    func findRouteFor(amountToMove n: Int, from: Int) -> [Int] {
        guard from < self.locations.count, from >= 0 else {
            return []
        }
        guard n < self.locations.count, n > 0 else {
            return []
        }
        
        let sinope = 23
        
        var result = [Int]()
        var at = from
        var next = self.connections[at]
        var toGo = n
        while toGo > 0 {
            result.append(next[0])
            toGo -= 1
            at = result.last!
            next = self.connections[at]
        }
        if locations[at].type == .blackDot {
            // Backup!
            while locations[at].type == .blackDot {
                toGo += 1
                at = result[(n-1) - toGo]
                result.append(at)
            }
            if at == sinope { // Sinope Special Rule!
                toGo += 1
                at = result[(n-1) - toGo]
                result.append(at)
            }
            if connections[at].count > 1 {
                at = connections[at][1]
                result.append(at)
                toGo -= 1
                let restOfRoute = findRouteFor(amountToMove: toGo, from: at)
                result.append(contentsOf: restOfRoute)
            }
        }
        
        return result
    }

}
