struct RedShiftCard {
    let message : String
    var goto: Int?
    let use: Int?
    
    init(message: String, goto: Int? = nil, use: Int? = nil) {
        self.message = message
        self.goto = goto
        self.use = use
    }
    
}

struct RedShiftCardDeck {
    static let locations : [MutableLocation] = StandardMap.listLocations(in: StandardMap.createMap())
    
    static func deal() -> [RedShiftCard] {
        return [RedShiftCardDeck.MeteorShower()]
    }
    
    static func MeteorShower() -> RedShiftCard {
        RedShiftCard(message: "Engage primary force field; Do not move; Use 3 hydrons of fue", use: 3)
    }
    
    static func GoTo(position: Int, fuelCost: Int) -> RedShiftCard {
        let name = locations[position].name
        return RedShiftCard(message: "Go To \(name), use \(fuelCost) hydrons of fuel.", goto: position, use: fuelCost)
    }
}
