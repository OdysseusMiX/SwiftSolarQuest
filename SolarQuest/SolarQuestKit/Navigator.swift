protocol Navigator {
    var locations_xxx: [LocationWithOrbitData] {get set}
    var locations: [Location] {get}
    func nextLocation(from: Int, moving: Int) -> Int
}
