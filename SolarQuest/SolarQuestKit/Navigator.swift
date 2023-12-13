protocol Navigator {
    var locations: [MutableLocation] {get set}
    func nextLocation(from: Int, moving: Int) -> Int
}
