protocol FuelManager {
    func calculateFuelCost(toMove: Int, from: Location) -> Int
    func mustRefuelNow(hydrons: Int, on: Location) -> Bool
}
