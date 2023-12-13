struct StandardFuelManager : FuelManager {
    func calculateFuelCost(toMove: Int, from location: MutableLocation) -> Int {
        switch location.type {
        case .planet, .moon:
            return toMove
        default:
            return 0
        }
    }
    
    func mustRefuelNow(hydrons: Int, on location: MutableLocation) -> Bool {
        if hydrons < 2 {
            if location.type == .moon || location.type == .planet {
                return true
            }
        }
        return false
    }
    
}
