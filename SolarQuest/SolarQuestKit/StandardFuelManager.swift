struct StandardFuelManager : FuelManager {
    func calculateFuelCost(toMove: Int, from location: Location) -> Int {
        if location.costsFuelToBlastOff {
            return toMove
        } else {
            return 0
        }
    }
    
    func mustRefuelNow(hydrons: Int, on location: Location) -> Bool {
        if hydrons < 2, location.costsFuelToBlastOff {
            return true
        } else {
            return false
        }
    }
}
