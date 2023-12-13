protocol Navigator {
    var locations: [Location] {get set}
    func nextLocation(from: Int, moving: Int) -> Int
}
