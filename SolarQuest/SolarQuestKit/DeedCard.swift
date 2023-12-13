struct DeedCard : Equatable {
    let name : String
    let group: String
    let price : Int
    let groupSize : Int
    let rent : [Int]
    let fuelRate : [Int]?
    
    init(name: String, group: String, price: Int, rent: [Int], fuelRate: [Int]?) {
        
        if let fuelRate = fuelRate {
            if rent.count != fuelRate.count {
                fatalError("Rent and Fuel Rate arrays are not same length")
            }
        }
        
        self.name = name
        self.group = group
        self.price = price
        self.groupSize = rent.count
        self.rent = rent
        self.fuelRate = fuelRate
    }
}
