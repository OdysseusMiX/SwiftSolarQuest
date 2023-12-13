struct StandardDeedCardFactory {

    static func make(_ name: String) -> DeedCard? {
        let group : String
        let price : Int
        let rent : [Int]
        var fuelRate : [Int]? = nil
        
        switch name {
        case "Solar Space Dock","Jupiter Space Dock","Saturn Space Dock","Uranus Space Dock","Neptune Space Dock": group = "Space Dock"
        case "Venus Research Lab","Earth Research Lab","Jupiter Research Lab","Saturn Research Lab","Uranus Research Lab","Neptune Research Lab": group = "Research Lab"
        case "Mercury": group = name
        case "Venus": group = name
        case "Moon": group = "Earth"
        case "Mars","Phobos","Deimos": group = "Mars"
        case "Ganymede","Callisto","Io": group = "Jupiter"
        default:
            return nil
        }

        switch name {
        case "Solar Space Dock": price = 250
        case "Jupiter Space Dock": price = 150
        case "Saturn Space Dock": price = 200
        case "Uranus Space Dock": price = 175
        case "Neptune Space Dock": price = 225
            
        case "Venus Research Lab": price = 275
        case "Earth Research Lab": price = 400
        case "Jupiter Research Lab": price = 250
        case "Saturn Research Lab": price = 250
        case "Uranus Research Lab": price = 325
        case "Neptune Research Lab": price = 350
            
        case "Mercury": price = 375
        case "Venus": price = 475
        case "Moon": price = 225
        case "Mars": price = 295
        case "Phobos": price = 45
        case "Deimos": price = 35
        case "Ganymede": price = 260
        case "Callisto": price = 260
        case "Io": price = 230
        default:
            return nil
        }

        switch name {
        case "Solar Space Dock": rent = [75, 150, 375, 1125, 3940]
        case "Jupiter Space Dock": rent = [35, 70, 175, 525, 1840]
        case "Saturn Space Dock": rent = [55, 110, 275, 825, 2890]
        case "Uranus Space Dock": rent = [45, 90, 225, 675, 2360]
        case "Neptune Space Dock": rent = [65, 130, 325, 935, 3410]
        case "Venus Research Lab": rent = [115, 220, 425, 820, 1575, 3025]
        case "Earth Research Lab": rent = [180, 345, 660, 1270, 2435, 4670]
        case "Jupiter Research Lab": rent = [70, 135, 265, 505, 970, 1865]
        case "Saturn Research Lab": rent = [105, 205, 395, 760, 1460, 2800]
        case "Uranus Research Lab": rent = [125, 240, 460, 890, 1705, 3265]
        case "Neptune Research Lab": rent = [140, 275, 530, 1015, 1945, 3735]
        case "Mercury": rent = [1035]
        case "Venus": rent = [1400]
        case "Moon": rent = [440]
        case "Mars": rent = [365, 1040, 2955]
        case "Phobos": rent = [115, 330, 935]
        case "Deimos": rent = [85, 250, 715]
        case "Ganymede": rent = [125, 190, 285, 430, 645, 970, 1460, 2190, 3290, 4935, 7400]
        case "Callisto": rent = [125, 185, 280, 425, 635, 955, 1435, 2155, 3230, 4850, 7275]
        case "Io": rent = [110, 170, 255, 380, 570, 860, 1290, 1935, 2905, 4360, 6540]
        default:
            return nil
        }

        switch name {
        case "Solar Space Dock": fuelRate =  [10, 15, 20, 30, 40]
        case "Jupiter Space Dock": fuelRate =  [5, 5, 10, 10, 20]
        case "Saturn Space Dock": fuelRate =  [5, 10, 15, 20, 30]
        case "Uranus Space Dock": fuelRate =  [5, 10, 10, 20, 25]
        case "Neptune Space Dock": fuelRate =  [5, 10, 15, 25, 35]
        case "Mercury": fuelRate = [25]
        case "Venus": fuelRate =  [25]
        case "Moon": fuelRate = [20]
        case "Mars": fuelRate =  [20, 35, 65]
        case "Phobos": fuelRate =  [10, 25, 40]
        case "Deimos": fuelRate =  [10, 20, 40]
        case "Ganymede": fuelRate =  [15, 20, 25, 30, 35, 45, 50, 60, 75, 90, 110]
        case "Callisto": fuelRate =  [15, 20, 25, 30, 35, 40, 50, 60, 75, 90, 110]
        case "Io": fuelRate =  [15, 20, 25, 30, 35, 45, 50, 60, 75, 90, 105]
        default:
            fuelRate = nil
        }

        return DeedCard(name: name, group: group, price: price, rent: rent, fuelRate: fuelRate)
    }
}
