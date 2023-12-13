struct StandardNavigator : Navigator {
    var locations: [Location]
    
        func nextLocation(from: Int, moving: Int) -> Int {
            var pos = nextLocation(from: from, moving: moving, shouldBreakOrbit: true)
            
            if locations[pos].type == .blackDot {
                pulledBackByGravity(&pos)

                if locations[pos].isInOrbit {
                    // Cannot Break Orbit, Recalcalute landing site
                    pos = nextLocation(from: from, moving: moving, shouldBreakOrbit: false)
                }
            }
            return pos
        }
        func nextLocation(from: Int, moving: Int, shouldBreakOrbit: Bool = true ) -> Int {
             let maxPos = locations.count-1
            
            var pos = from
            for _ in 1...moving {
                if locations[pos].isInOrbit {
                    if shouldBreakOrbit, locations[pos].isBreakOrbitPoint {
                        breakOrbit(&pos)
                    } else {
                        nextInOrbit(&pos)
                    }
                } else {
                    pos += 1
                }
                
                if pos > maxPos {
                    // Wrap Around
                    pos = 0
                }
            }
            return pos
        }
        func pulledBackByGravity(_ pos: inout Int) {
            while locations[pos].type == .blackDot {
                pos -= 1
            }
        }
        func breakOrbit( _ pos: inout Int) {
            while locations[pos].isInOrbit {
                pos += 1
            }
        }
        func nextInOrbit(_ pos: inout Int) {
            pos += 1
            if !locations[pos].isInOrbit {
                // Go to begining orbit
                while locations[pos-1].isInOrbit {
                    // TODO: Handle case where start is also orbit entry
                    pos -= 1
                }
            }
        }
}
