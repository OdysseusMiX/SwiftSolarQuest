struct StandardNavigator : Navigator {
    var locations_xxx: [LocationWithOrbitData]
    let locations: [Location]
    
    func nextLocation(from: Int, moving: Int) -> Int {
        var pos = nextLocation(from: from, moving: moving, shouldBreakOrbit: true)
        
        if locations_xxx[pos].type == .blackDot {
            pulledBackByGravity(&pos)
            
            if locations_xxx[pos].isInOrbit {
                // Cannot Break Orbit, Recalcalute landing site
                pos = nextLocation(from: from, moving: moving, shouldBreakOrbit: false)
            }
        }
        return pos
    }
    func nextLocation(from: Int, moving: Int, shouldBreakOrbit: Bool = true ) -> Int {
        let maxPos = locations_xxx.count-1
        
        var pos = from
        for _ in 1...moving {
            if locations_xxx[pos].isInOrbit {
                if shouldBreakOrbit, locations_xxx[pos].isBreakOrbitPoint {
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
        while locations_xxx[pos].type == .blackDot {
            pos -= 1
        }
    }
    func breakOrbit( _ pos: inout Int) {
        while locations_xxx[pos].isInOrbit {
            pos += 1
        }
    }
    func nextInOrbit(_ pos: inout Int) {
        pos += 1
        if !locations_xxx[pos].isInOrbit {
            // Go to begining orbit
            while locations_xxx[pos-1].isInOrbit {
                // TODO: Handle case where start is also orbit entry
                pos -= 1
            }
        }
    }
}
