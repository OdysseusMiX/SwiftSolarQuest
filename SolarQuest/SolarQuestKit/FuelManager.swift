protocol FuelManager {
    func calculateFuelCost(toMove: Int, from: MutableLocation) -> Int
    func mustRefuelNow(hydrons: Int, on: MutableLocation) -> Bool
}
