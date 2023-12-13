protocol Navigator {
    var locations: [LocationWithOrbitData] {get set}
    func nextLocation(from: Int, moving: Int) -> Int
}
