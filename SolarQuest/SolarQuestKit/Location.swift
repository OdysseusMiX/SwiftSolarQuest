
import Foundation

struct Location: Equatable {
    let type : LocationType
    let name : String
        
    let group : String?
    let price : Int?
    let rent : [Int]?
    let fuelCost : [Int]?
    let costsFuelToBlastOff : Bool
    let hasFuelWithoutFuelStation : Bool
    let canPlaceFuelStation : Bool
    let landingBonusFederons : Int?
    let landingBonusFuelStations: Int?
//    let imageName : String?
    let funFacts : String
    
//    init(name: String, type: LocationType, group: String? = nil, price: Int? = nil, rent: [Int]? = nil, fuelCost: [Int]? = nil, costsFuelToBlastOff: Bool = true, hasFuelWithoutFuelStation: Bool = false, canPlaceFuelStation: Bool = false, landingBonusFederons: Int? = nil, landingBonusFuelStations: Int? = nil, funFacts: String = ""){
//        self.name = name
//        self.price = price
//        self.group = group
//        self.rent = rent
//        self.fuelCost = fuelCost
//        self.costsFuelToBlastOff = costsFuelToBlastOff
//        self.hasFuelWithoutFuelStation = hasFuelWithoutFuelStation
//        self.canPlaceFuelStation = canPlaceFuelStation
//        self.landingBonusFederons = landingBonusFederons
//        self.landingBonusFuelStations = landingBonusFuelStations
//        self.funFacts = funFacts
//    }
    
    init(moon: String, group: String, price: Int, rent: [Int], fuelCost: [Int], funFacts: String = "") {
        self.name = moon
        self.type = .moon
        self.price = price
        self.group = group
        self.rent = rent
        self.fuelCost = fuelCost
        self.costsFuelToBlastOff = true
        self.hasFuelWithoutFuelStation = false
        self.canPlaceFuelStation = true
        self.landingBonusFederons = nil
        self.landingBonusFuelStations = nil
        self.funFacts = funFacts
    }
    init(planet: String, group: String, price: Int, rent: [Int], fuelCost: [Int], funFacts: String = "") {
        self.name = planet
        self.type = .planet
        self.price = price
        self.group = group
        self.rent = rent
        self.fuelCost = fuelCost
        self.costsFuelToBlastOff = true
        self.hasFuelWithoutFuelStation = false
        self.canPlaceFuelStation = true
        self.landingBonusFederons = nil
        self.landingBonusFuelStations = nil
        self.funFacts = funFacts
    }
    init(spaceDock: String, price: Int, rent: [Int], fuelCost: [Int], funFacts: String = "") {
        self.name = spaceDock
        self.type = .spaceDock
        self.price = price
        self.group = "Space Docks"
        self.rent = rent
        self.fuelCost = fuelCost
        self.costsFuelToBlastOff = false
        self.hasFuelWithoutFuelStation = true
        self.canPlaceFuelStation = false
        self.landingBonusFederons = nil
        self.landingBonusFuelStations = nil
        self.funFacts = funFacts
    }
    init(researchLab: String, price: Int, rent: [Int], funFacts: String = "") {
        self.name = researchLab
        self.type = .researchLab
        self.price = price
        self.group = "Research Labs"
        self.rent = rent
        self.fuelCost = nil
        self.costsFuelToBlastOff = false
        self.hasFuelWithoutFuelStation = false
        self.canPlaceFuelStation = false
        self.landingBonusFederons = nil
        self.landingBonusFuelStations = nil
        self.funFacts = funFacts
    }
    init(federationPlanet: String, fuelCost: [Int], landingBonusFederons: Int? = nil, landingBonusFuelStations: Int? = nil) {
        self.name = federationPlanet
        self.type = .planet
        self.price = nil
        self.group = nil
        self.rent = nil
        self.fuelCost = fuelCost
        self.costsFuelToBlastOff = true
        self.hasFuelWithoutFuelStation = true
        self.canPlaceFuelStation = false
        self.landingBonusFederons = landingBonusFederons
        self.landingBonusFuelStations = landingBonusFuelStations
        self.funFacts = ""
    }
    init(federationStation: String, landingBonusFederons: Int? = nil, landingBonusFuelStations: Int? = nil) {
        self.name = federationStation
        self.type = .federationStation
        self.price = nil
        self.group = nil
        self.rent = nil
        self.fuelCost = nil
        self.costsFuelToBlastOff = false
        self.hasFuelWithoutFuelStation = false
        self.canPlaceFuelStation = false
        self.landingBonusFederons = landingBonusFederons
        self.landingBonusFuelStations = landingBonusFuelStations
        self.funFacts = ""
    }
    init(blackDot: String) {
        self.name = blackDot
        self.type = .blackDot
        self.price = nil
        self.group = nil
        self.rent = nil
        self.fuelCost = nil
        self.costsFuelToBlastOff = false
        self.hasFuelWithoutFuelStation = false
        self.canPlaceFuelStation = false
        self.landingBonusFederons = nil
        self.landingBonusFuelStations = nil
        self.funFacts = ""
    }
    init(blueDot: String) {
        self.name = blueDot
        self.type = .blueDot
        self.price = nil
        self.group = nil
        self.rent = nil
        self.fuelCost = nil
        self.costsFuelToBlastOff = false
        self.hasFuelWithoutFuelStation = false
        self.canPlaceFuelStation = false
        self.landingBonusFederons = nil
        self.landingBonusFuelStations = nil
        self.funFacts = ""
    }
    
    init(name: String, type: LocationType) {
        self.name = name
        self.type = type
        
        // TODO: Move all this logic to Standard Map!
        let deedCard = StandardDeedCardFactory.make(name)
        
        if name == "Earth" {
            self.group = nil
            self.price = nil
            self.rent = nil
            self.fuelCost = [25]
            self.hasFuelWithoutFuelStation =  true
            self.canPlaceFuelStation = false
            self.landingBonusFederons = 500
            self.landingBonusFuelStations = 0
            self.costsFuelToBlastOff = true

        } else {
            
            if let deed = deedCard {
                self.group = deed.group
                self.price = deed.price
                self.rent = deed.rent
                self.fuelCost = deed.fuelRate
            } else {
                self.group = nil
                self.price = nil
                self.rent = nil
                self.fuelCost = nil
            }
            
            self.landingBonusFederons = 0
            self.landingBonusFuelStations = 0
            
            switch type {
            case .blackDot, .blueDot, .federationStation, .researchLab:
                self.costsFuelToBlastOff = false
                self.hasFuelWithoutFuelStation = false
                self.canPlaceFuelStation = false
            case .spaceDock:
                self.costsFuelToBlastOff = false
                self.hasFuelWithoutFuelStation = true
                self.canPlaceFuelStation = false
            case .moon,.planet:
                self.costsFuelToBlastOff = true
                self.hasFuelWithoutFuelStation =  false
                self.canPlaceFuelStation = true
            }
        }
        self.funFacts = ""
    }
}

enum LocationType: Equatable {
    case planet
    case moon
    case spaceDock
    case researchLab
    case federationStation
    case blueDot // drifting
    case blackDot // planetary gravity well
}
