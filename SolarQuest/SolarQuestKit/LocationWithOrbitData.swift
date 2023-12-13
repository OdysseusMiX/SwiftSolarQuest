struct LocationWithOrbitData: Equatable {
    let data : Location

    let isInOrbit: Bool
    let isBreakOrbitPoint : Bool

    var name : String {data.name}
    var type : LocationType {data.type}
    
    init(name: String, type: LocationType, isInOrbit: Bool = false, isBreakOrbitPoint: Bool = false, fuelRate: Int? = nil) {
        self.data = Location(name: name, type: type)
        self.isInOrbit = isInOrbit
        self.isBreakOrbitPoint = isBreakOrbitPoint
    }
}

// Game needs function to find possible moves for roll:
//  - Sinope is special rule
//  - Rolling Doubles is special rule
//
//  func nextLocation(at: Int, toMove: Int) -> [Location]
//    landing on the first black hole after Sinope should return 3 locations [Black Hole, Sinope, Jupiter Research Lab]


//  --- Set the following for each ---
// let canLand : Bool
// let requiresBlastOff : Bool
// let canBuy : Bool
// let alwaysHasFuel : Bool
// let canAddFuelStation : Bool
// var hasAddedFuelStation : Bool
// let bonus : ???


// PropertyCard
   // let price: Int
   // let neighborhood : Neighborhood
   // let feeSchedule : [numberOwned : (rent, fuel)] : [Int : (Int, Int)]
   // static enum NeighborHood {
    // case Jupiter
    // case Uranus
    // case Pluto
    // case Mars
    // case Saturn
    // case Neptune
    // case SpaceDock
    // case ResearchLab

// Planets that have orbits
//   Jupiter
//   Uranus
//   Saturn
//   Neptune
