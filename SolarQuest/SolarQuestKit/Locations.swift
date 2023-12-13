public struct Location: Equatable {
    public let name : String
    public let type : LocationType
    
    public let isInOrbit: Bool
    public let isBreakOrbitPoint : Bool
    public var hasFuel: Bool
    public let deedCard : DeedCard?
    var owner : Int = 0 // player 0 is the Federation
    
    public init(name: String, type: LocationType, isInOrbit: Bool = false, isBreakOrbitPoint: Bool = false, hasFuel: Bool = false, fuelRate: Int? = nil) {
        self.name = name
        self.type = type
        self.isInOrbit = isInOrbit
        self.isBreakOrbitPoint = isBreakOrbitPoint
        self.hasFuel = hasFuel
        self.deedCard = StandardDeedCard.make(name)
    }
}

// Game needs function to find possible moves for roll:
//  - Sinope is special rule
//  - Rolling Doubles is special rule
//
//  func nextLocation(at: Int, toMove: Int) -> [Location]
//    landing on the first black hole after Sinope should return 3 locations [Black Hole, Sinope, Jupiter Research Lab]

public enum LocationType: Equatable {
    case planet
    case moon
    case spaceDock
    case researchLab
    case federationStation
    case blueDot // drifting
    case blackDot // planetary gravity well
}

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
