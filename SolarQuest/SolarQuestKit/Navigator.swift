protocol Navigator {
    var locations: [Location] {get}
    func nextLocation(from: Int, moving: Int) -> Int
    func findRouteFor(amountToMove n: Int, from: Int) -> [Int]
}
