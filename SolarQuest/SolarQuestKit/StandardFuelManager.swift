struct StandardFuelManager : FuelManager {
    func calculateFuelCost(toMove: Int, from location: Location) -> Int {
        switch location.type {
        case .planet, .moon:
            return toMove
        default:
            return 0
        }
    }
    
    func mustRefuelNow(hydrons: Int, on location: Location) -> Bool {
        if hydrons < 2 {
            if location.type == .moon || location.type == .planet {
                return true
            }
        }
        return false
    }
    
}
