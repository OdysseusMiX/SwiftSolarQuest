
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
    let imageName : String?
    let funFacts : String = ""
    
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
            self.imageName = nil
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
            self.imageName = nil
            
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
