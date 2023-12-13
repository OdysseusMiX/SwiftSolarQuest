import Foundation

struct StandardLocations {
    
    static func Earth() -> Location {
        Location(federationPlanet: "Earth", fuelCost: [25], landingBonusFederons: 500)
    }
    static func BlackDot() -> Location {
        Location(blackDot: "Gravity Well")
    }
    static func BlueDot() -> Location {
        Location(blueDot: "Drifting")
    }
    
    static func Moon() -> Location {
        Location(moon: "Moon", group: "Earth", price: 225, rent: [440], fuelCost: [20])
    }
    static func Mercury() -> Location {
        Location(planet: "Mercury", group: "Mercury", price: 375, rent: [1035], fuelCost: [25])
    }
    
    // MARK: Jupiter
    static func Ganymede() -> Location {
        Location(moon: "Ganymede", group: "Jupiter", price: 260, rent: [125, 190, 285, 430, 645, 970, 1460, 2190, 3290, 4935, 7400], fuelCost: [15, 20, 25, 30, 35, 45, 50, 60, 75, 90, 110])
    }
    static func Callisto() -> Location {
        Location(moon: "Callisto", group: "Jupiter", price: 260, rent: [125, 185, 280, 425, 635, 955, 1435, 2155, 3230, 4850, 7275], fuelCost: [15, 20, 25, 30, 35, 40, 50, 60, 75, 90, 110])
    }
    static func Io() -> Location {
        Location(moon: "Io", group: "Jupiter", price: 230, rent: [110, 170, 255, 380, 570, 860, 1290, 1935, 2905, 4360, 6540], fuelCost: [15, 20, 25, 30, 35, 45, 50, 60, 75, 90, 105])
    }
    static func Europa() -> Location {
        Location(moon: "Europa", group: "Jupiter", price: 220, rent: [105, 160, 240, 360, 545, 820, 1230, 1845, 2765, 4150, 6225], fuelCost: [15, 20, 20, 25, 35, 40, 50, 60, 70, 85, 105])
    }
    static func Himalia() -> Location {
        Location(moon: "Himalia", group: "Jupiter", price: 85, rent: [40, 60, 90, 135, 205, 310, 465, 695, 1045, 1570, 2355], fuelCost: [10, 15, 15, 20, 25, 30, 35, 45, 55, 65, 80])
    }
    static func Amalthea() -> Location {
        Location(moon: "Amalthea", group: "Jupiter", price: 85, rent: [40, 60, 90, 135, 205, 310, 465, 695, 1045, 1570, 2355], fuelCost: [10, 15, 15, 20, 25, 30, 35, 45, 55, 65, 80])
    }
    static func Elara() -> Location {
        Location(moon: "Elara", group: "Jupiter", price: 65, rent: [30, 45, 70, 105, 155, 235, 350, 530, 795, 1195, 1790], fuelCost: [10, 10, 15, 20, 20, 25, 35, 40, 50, 60, 70])
    }
    static func Thebe() -> Location {
        Location(moon: "Thebe", group: "Jupiter", price: 65, rent: [30, 45, 70, 105, 160, 240, 360, 540, 810, 1220, 1830], fuelCost: [10, 10, 15, 20, 20, 25, 35, 40, 50, 60, 70])
    }
    static func Metis() -> Location {
        Location(moon: "Metis", group: "Jupiter", price: 50, rent: [25, 35, 55, 85, 125, 190, 285, 430, 645, 970, 1455], fuelCost: [10, 10, 15, 15, 20, 25, 30, 35, 45, 55, 65])
    }
    static func Sinope() -> Location {
        Location(moon: "Sinope", group: "Jupiter", price: 45, rent: [20, 30, 50, 75, 110, 170, 255, 380, 570, 860, 1290], fuelCost: [10, 10, 15, 15, 20, 25, 30, 35, 45, 50, 65])
    }
    static func Adrastea() -> Location {
        Location(moon: "Adrastea", group: "Jupiter", price: 45, rent: [20, 30, 45, 70, 105, 160, 245, 365, 550, 825, 1240], fuelCost: [10, 10, 10, 15, 20, 25, 30, 35, 40, 50, 60])
    }

    //MARK: Uranus
    static func Titania() -> Location {
        Location(moon: "Titania", group: "Uranus", price: 175, rent: [125, 240, 460, 890, 1705, 3270], fuelCost: [15, 20, 30, 45, 60, 85])
    }
    static func Oberon() -> Location {
        Location(moon: "Oberon", group: "Uranus", price: 175, rent: [125, 240, 460, 880, 1690, 3240], fuelCost: [15, 20, 30, 45, 60, 85])
    }
    static func Umbriel() -> Location {
        Location(moon: "Umbriel", group: "Uranus", price: 160, rent: [110, 220, 420, 805, 1545, 2965], fuelCost: [15, 20, 30, 40, 60, 80])
    }
    static func Ariel() -> Location {
        Location(moon: "Ariel", group: "Uranus", price: 160, rent: [110, 215, 415, 800, 1540, 2950], fuelCost: [15, 20, 30, 40, 60, 80])
    }
    static func Miranda() -> Location {
        Location(moon: "Miranda", group: "Uranus", price: 120, rent: [80, 160, 310, 595, 1140, 2190], fuelCost: [15, 20, 30, 40, 55, 75])
    }
    static func _1985U1() -> Location {
        Location(moon: "1985 U1", group: "Uranus", price: 80, rent: [55, 110, 215, 415, 800, 1535], fuelCost: [10, 20, 25, 35, 50, 70])
    }

    //MARK: Pluto
    static func Pluto() -> Location {
        Location(planet: "Pluto", group: "Pluto", price: 325, rent: [415, 1570], fuelCost: [20, 45])
    }
    static func Charon() -> Location {
        Location(planet: "Charon", group: "Pluto", price: 160, rent: [315, 1185], fuelCost: [20, 45])
    }

    //MARK: Mars
    static func Mars() -> Location {
        Location(planet: "Mars", group: "Mars", price: 295, rent: [365, 1040, 2955], fuelCost: [20, 35, 65])
    }
    static func Phobos() -> Location {
        Location(moon: "Phobos", group: "Mars", price: 45, rent: [115, 330, 935], fuelCost: [10, 25, 40])
    }
    static func Deimos() -> Location {
        Location(moon: "Diemos", group: "Mars", price: 35, rent: [85, 250, 715], fuelCost: [10, 20, 40])
    }
    
    //MARK: Venus
    static func Venus() -> Location {
        Location(planet: "Venus", group: "Venus", price: 475, rent: [1400], fuelCost: [25])
    }
    
    //MARK: Saturn
    static func Titan() -> Location {
        Location(moon: "Titan", group: "Saturn", price: 260, rent: [130, 205, 320, 495, 770, 1200, 1860, 2885, 4470, 6930], fuelCost: [15, 20, 25, 30, 40, 45, 60, 70, 85, 105])
    }
    static func Rhea() -> Location {
        Location(moon: "Rhea", group: "Saturn", price: 175, rent: [85, 135, 215, 330, 515, 800, 1240, 1925, 2980, 4625], fuelCost: [15, 20, 20, 30, 35, 40, 50, 65, 80, 95])
    }
    static func Iapetus() -> Location {
        Location(moon: "Iapetus", group: "Saturn", price: 170, rent: [85, 135, 210, 325, 505, 785, 1220, 1895, 2935, 4550], fuelCost: [15, 20, 20, 25, 35, 40, 50, 65, 80, 95])
    }
    static func Mimas() -> Location {
        Location(moon: "Mimas", group: "Saturn", price: 110, rent: [55, 85, 135, 210, 325, 505, 785, 1220, 1890, 2930], fuelCost: [10, 15, 20, 25, 30, 35, 45, 55, 70, 85])
    }
    static func Tethys() -> Location {
        Location(moon: "Tethys", group: "Saturn", price: 150, rent: [75, 120, 190, 295, 455, 705, 1095, 1700, 2640, 4090], fuelCost: [15, 15, 20, 25, 35, 40, 50, 60, 75, 90])
    }
    static func Dione() -> Location {
        Location(moon: "Dione", group: "Saturn", price: 150, rent: [80, 125, 190, 300, 465, 720, 1115, 1735, 2685, 4165], fuelCost: [15, 15, 20, 25, 35, 40, 50, 60, 75, 95])
    }
    static func Enceladus() -> Location {
        Location(moon: "Enceladus", group: "Saturn", price: 120, rent: [60, 95, 145, 225, 355, 550, 855, 1325, 2055, 3185], fuelCost: [10, 15, 20, 25, 30, 40, 45, 55, 70, 85])
    }
    static func Hyperion() -> Location {
        Location(moon: "Hyperion", group: "Saturn", price: 95, rent: [45, 75, 115, 180, 280, 440, 680, 1055, 1640, 2545], fuelCost: [10, 15, 20, 25, 30, 35, 45, 55, 65, 80])
    }
    static func Phoebe() -> Location {
        Location(moon: "Phoebe", group: "Saturn", price: 90, rent: [45, 70, 110, 170, 270, 415, 650, 1005, 1560, 2420], fuelCost: [10, 15, 20, 20, 30, 35, 45, 55, 65, 80])
    }
    static func Janus() -> Location {
        Location(moon: "Janus", group: "Saturn", price: 85, rent: [40, 65, 105, 165, 255, 395, 615, 960, 1485, 2305], fuelCost: [10, 15, 20, 20, 25, 35, 40, 50, 65, 80])
    }

    //MARK: Neptune
    static func Triton() -> Location {
        Location(moon: "Triton", group: "Neptune", price: 230, rent: [450, 1695], fuelCost: [20, 45])
    }
    static func Nereid() -> Location {
        Location(moon: "Nereid", group: "Neptune", price: 110, rent: [190, 725], fuelCost: [15, 40])
    }

    //MARK: Space Docks
    static func SolarSpaceDock() -> Location {
        Location(spaceDock: "Solar Space Dock", price: 250, rent: [75, 150, 375, 1125, 3940], fuelCost: [10, 15, 20, 30, 40])
    }
    static func JupiterSpaceDock() -> Location {
        Location(spaceDock: "Jupiter Space Dock", price: 150, rent: [35, 70, 175, 525, 1840], fuelCost: [5, 5, 10, 10, 20])
    }
    static func SaturnSpaceDock() -> Location {
        Location(spaceDock: "Saturn Space Dock", price: 200, rent: [55, 110, 275, 825, 2890], fuelCost: [5, 10, 15, 20, 30])
    }
    static func UranusSpaceDock() -> Location {
        Location(spaceDock: "Uranus Space Dock", price: 175, rent: [45, 90, 225, 675, 2360], fuelCost: [5, 10, 10, 20, 25])
    }
    static func NeptuneSpaceDock() -> Location {
        Location(spaceDock: "Neptune Space Dock", price: 225, rent: [65, 130, 325, 935, 3410], fuelCost: [5, 10, 15, 25, 35])
    }
    

    //MARK: Research Labs
    static func VenusResearchLab() -> Location {
        Location(researchLab: "Venus Research Lab", price: 275, rent: [115, 220, 425, 820, 1575, 3025])
    }
    static func EarthResearchLab() -> Location {
        Location(researchLab: "Earth Research Lab", price: 400, rent: [180, 345, 660, 1270, 2435, 4670])
    }
    static func JupiterResearchLab() -> Location {
        Location(researchLab: "Jupiter Research Lab", price: 250, rent: [70, 135, 265, 505, 970, 1865])
    }
    static func SaturnResearchLab() -> Location {
        Location(researchLab: "Saturn Research Lab", price: 250, rent: [105, 205, 395, 760, 1460, 2800])
    }
    static func UranusResearchLab() -> Location {
        Location(researchLab: "Uranus Research Lab", price: 325, rent: [125, 240, 460, 890, 1705, 3265])
    }
    static func NeptuneResearchLab() -> Location {
        Location(researchLab: "Neptune Research Lab", price: 350, rent: [140, 275, 530, 1015, 1945, 3735])
    }


    //MARK: Federation Stations
    static func FederationStation1() -> Location {
        Location(federationStation: "Federation Station I", landingBonusFederons: 450, landingBonusFuelStations: nil)
    }
    static func FederationStation2() -> Location {
        Location(federationStation: "Federation Station II", landingBonusFederons: 200, landingBonusFuelStations: nil)
    }
    static func FederationStation3() -> Location {
        Location(federationStation: "Federation Station III", landingBonusFederons: 600, landingBonusFuelStations: nil)
    }
    static func FederationStation4() -> Location {
        Location(federationStation: "Federation Station IV", landingBonusFederons: nil, landingBonusFuelStations: 1)
    }
    static func FederationStation5() -> Location {
        Location(federationStation: "Federation Station V", landingBonusFederons: 400, landingBonusFuelStations: nil)
    }
    static func FederationStation6() -> Location {
        Location(federationStation: "Federation Station VI", landingBonusFederons: 250, landingBonusFuelStations: nil)
    }
    static func FederationStation7() -> Location {
        Location(federationStation: "Federation Station VII", landingBonusFederons: 350, landingBonusFuelStations: nil)
    }
    static func FederationStation8() -> Location {
        Location(federationStation: "Federation Station VIII", landingBonusFederons: 500, landingBonusFuelStations: nil)
    }
    static func FederationStation9() -> Location {
        Location(federationStation: "Federation Station IX", landingBonusFederons: 300, landingBonusFuelStations: nil)
    }
}
