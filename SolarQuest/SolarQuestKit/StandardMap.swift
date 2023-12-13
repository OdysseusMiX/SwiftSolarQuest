struct StandardMap: Map {
    static func listLocations(in data: MapData) -> [Location] {
        return GenericMap.listLocations(in: data)
    }
    static func listConnections(in data: MapData) -> [[Int]] {
        return GenericMap.listConnections(in: data)
    }


    static func createMap() -> [(LocationWithOrbitData, [Int])] {
        [
            (StandardMap.Earth(), [1]),    // 0
            (StandardMap.BlackDot(), [2]),
            (StandardMap.Moon(), [3]),
            (StandardMap.SolarSpaceDock(), [4]),
            (StandardMap.Mercury(), [5]),
            (StandardMap.FederationStationI(), [6]),
            (StandardMap.BlueDot(), [7]),
            (StandardMap.BlueDot(), [8]),
            // JUPITER ORBIT:
            (StandardMap.Io(), [9]),
            (StandardMap.JupiterSpaceDock(), [10]),
            (StandardMap.OrbitalBlueDot(),  [11]),      // 10
            (StandardMap.Elara(), [12]),
            (StandardMap.Callisto(), [13]),
            (StandardMap.FederationStationII(), [14]),
            (StandardMap.Thebe(), [15]),
            (StandardMap.OrbitalBlueDot(), [16]),
            (StandardMap.Metis(), [17]),
            (StandardMap.Ganymede(),  [23, 18]),// <break orbit point>
            (StandardMap.JupiterResearchLab(), [19]),
            (StandardMap.Himalia(), [20]),
            (StandardMap.Europa(), [21]),               // 20
            (StandardMap.Amalthea(), [22]),
            (StandardMap.Adrastea(), [8]),
            // END JUPITER ORBIT
            (StandardMap.Sinope(), [24]), // requires special rule
            (StandardMap.BlackDot(), [25]),
            (StandardMap.BlackDot(), [26]),
            (StandardMap.BlackDot(), [27]),
            (StandardMap.BlackDot(), [28]),
            (StandardMap.FederationStationIII(), [29]),
            (StandardMap.BlueDot(), [30]),
//            // URANUS ORBIT:
            (StandardMap.Miranda(), [31]), // 30
            (StandardMap.UranusSpaceDock(), [32]),
            (StandardMap.Umbriel(), [33]),
            (StandardMap.Oberon(), [34]),
            (StandardMap._1985U1(), [35]),
            (StandardMap.UranusResearchLab(), [36]),
            (StandardMap.OrbitalBlueDot(), [37]),
            (StandardMap.Ariel(), [40, 38]), // <break orbit point>
            (StandardMap.FederationStationIV(), [39]),
            (StandardMap.Titania(), [30]),
//            // END URANUS ORBIT
            (StandardMap.BlackDot(), [41]),  // 40
            (StandardMap.BlackDot(), [42]),
            (StandardMap.BlackDot(), [43]),
            (StandardMap.Pluto(), [44]),
            (StandardMap.Charon(), [45]),
            (StandardMap.BlueDot(), [46]),
            (StandardMap.FederationStationV(), [47]),
            (StandardMap.BlueDot(), [48]),
            (StandardMap.BlueDot(), [49]),
            (StandardMap.Phobos(), [50]),
            (StandardMap.Mars(), [51]),       // 50
            (StandardMap.Deimos(), [52]),
            (StandardMap.BlueDot(), [53]),
            (StandardMap.VenusResearchLab(), [54]),
            (StandardMap.Venus(), [55]),
            (StandardMap.BlackDot(), [56]),
            (StandardMap.Phoebe(), [57]),
//            // SATURN ORBIT:
            (StandardMap.Mimas(), [58]),
            (StandardMap.SaturnSpaceDock(), [59]),
            (StandardMap.Dione(), [60]),
            (StandardMap.OrbitalBlueDot(), [61]),     // 60
            (StandardMap.Iapetus(), [62]),
            (StandardMap.Rhea(), [63]),
            (StandardMap.Tethys(), [64]),
            (StandardMap.FederationStationVI(), [65]),
            (StandardMap.Janus(), [66]),
            (StandardMap.Enceladus(), [67]),
            (StandardMap.SaturnResearchLab(), [68]),
            (StandardMap.Hyperion(), [71, 69]), // <break orbit point>
            (StandardMap.Titan(), [70]),
            (StandardMap.FederationStationVII(), [57]),     // 70
//            // END SATURN ORBIT
            (StandardMap.BlackDot(), [72]),
            (StandardMap.BlackDot(), [73]),
            (StandardMap.BlackDot(), [74]),
            (StandardMap.BlackDot(), [75]),
            (StandardMap.FederationStationVIII(), [76]),
            (StandardMap.BlueDot(), [77]),
//            // ENTER NEPTUNE ORBIT
            (StandardMap.Nereid(), [78]),
            (StandardMap.OrbitalBlueDot(), [79]),
            (StandardMap.NeptuneSpaceDock(), [80]),
            (StandardMap.NeptuneResearchLab(), [81]),     // 80
            (StandardMap.OrbitalBlueDot(), [82]),
            (StandardMap.Triton(), [83]),
            (StandardMap.FederationStationIX(), [84]),
            (StandardMap.OrbitalBlueDotExitPoint(), [86, 85]), // break orbit from here
            (StandardMap.OrbitalBlueDot(), [77]),
//            // END NEPTUNE ORBIT
            (StandardMap.BlackDot(), [87]),
            (StandardMap.BlackDot(), [88]),
            (StandardMap.BlackDot(), [89]),
            (StandardMap.EarthResearchLab(), [0])   // 89
        ]
    }
    
    static func BlackDot() -> LocationWithOrbitData {LocationWithOrbitData(name: "Gravity Well", type: .blackDot)}
    static func BlueDot() -> LocationWithOrbitData {LocationWithOrbitData(name: "Drifting", type: .blueDot)}
    static func OrbitalBlueDot() -> LocationWithOrbitData {LocationWithOrbitData(name: "Drifting", type: .blueDot, isInOrbit: true)}
    static func OrbitalBlueDotExitPoint() -> LocationWithOrbitData {LocationWithOrbitData(name: "Drifting", type: .blueDot, isInOrbit: true, isBreakOrbitPoint: true)}

    static func Earth() -> LocationWithOrbitData {LocationWithOrbitData(name: "Earth", type: .planet, fuelRate: 25)}
    static func Moon() -> LocationWithOrbitData { LocationWithOrbitData(name: "Moon", type: .moon)}
    static func Mercury() -> LocationWithOrbitData { LocationWithOrbitData(name: "Mercury", type: .planet)}

    static func Io() -> LocationWithOrbitData {LocationWithOrbitData(name: "Io", type: .moon, isInOrbit: true)}
    static func Elara() -> LocationWithOrbitData {LocationWithOrbitData(name: "Elara", type: .moon, isInOrbit: true)}
    static func Callisto() -> LocationWithOrbitData {LocationWithOrbitData(name: "Callisto", type: .moon, isInOrbit: true)}
    static func Thebe() -> LocationWithOrbitData {LocationWithOrbitData(name: "Thebe", type: .moon, isInOrbit: true)}
    static func Metis() -> LocationWithOrbitData {LocationWithOrbitData(name: "Metis", type: .moon, isInOrbit: true)}
    static func Ganymede() -> LocationWithOrbitData {LocationWithOrbitData(name: "Ganymede", type: .moon, isInOrbit: true, isBreakOrbitPoint: true)}
    static func Himalia() -> LocationWithOrbitData {LocationWithOrbitData(name: "Himalia", type: .moon, isInOrbit: true)}
    static func Europa() -> LocationWithOrbitData {LocationWithOrbitData(name: "Europa", type: .moon, isInOrbit: true)}
    static func Amalthea() -> LocationWithOrbitData {LocationWithOrbitData(name: "Amalthea", type: .moon, isInOrbit: true)}
    static func Adrastea() -> LocationWithOrbitData {LocationWithOrbitData(name: "Adrastea", type: .moon, isInOrbit: true)}
    static func Sinope() -> LocationWithOrbitData {LocationWithOrbitData(name: "Sinope", type: .moon)}
    
    static func Miranda() -> LocationWithOrbitData {LocationWithOrbitData(name: "Miranda", type: .moon, isInOrbit: true)}
    static func Umbriel() -> LocationWithOrbitData {LocationWithOrbitData(name: "Umbriel", type: .moon, isInOrbit: true)}
    static func Oberon() -> LocationWithOrbitData {LocationWithOrbitData(name: "Oberon", type: .moon, isInOrbit: true)}
    static func _1985U1() -> LocationWithOrbitData {LocationWithOrbitData(name: "1985 U1", type: .moon, isInOrbit: true)}
    static func Ariel() -> LocationWithOrbitData {LocationWithOrbitData(name: "Ariel", type: .moon, isInOrbit: true, isBreakOrbitPoint: true)}
    static func Titania() -> LocationWithOrbitData {LocationWithOrbitData(name: "Titania", type: .moon, isInOrbit: true)}

    static func Pluto() -> LocationWithOrbitData { LocationWithOrbitData(name: "Pluto", type: .planet)}
    static func Charon() -> LocationWithOrbitData { LocationWithOrbitData(name: "Charon", type: .moon)}

    static func Phobos() -> LocationWithOrbitData { LocationWithOrbitData(name: "Phobos", type: .moon)}
    static func Mars() -> LocationWithOrbitData { LocationWithOrbitData(name: "Mars", type: .planet)}
    static func Deimos() -> LocationWithOrbitData { LocationWithOrbitData(name: "Deimos", type: .moon)}

    static func Venus() -> LocationWithOrbitData { LocationWithOrbitData(name: "Venus", type: .planet)}

    static func Phoebe() -> LocationWithOrbitData {LocationWithOrbitData(name: "Phoebe", type: .moon)}
    static func Mimas() -> LocationWithOrbitData {LocationWithOrbitData(name: "Mimas", type: .moon, isInOrbit: true)}
    static func Dione() -> LocationWithOrbitData {LocationWithOrbitData(name: "Dione", type: .moon, isInOrbit: true)}
    static func Iapetus() -> LocationWithOrbitData {LocationWithOrbitData(name: "Iapetus", type: .moon, isInOrbit: true)}
    static func Rhea() -> LocationWithOrbitData {LocationWithOrbitData(name: "Rhea", type: .moon, isInOrbit: true)}
    static func Tethys() -> LocationWithOrbitData {LocationWithOrbitData(name: "Tethys", type: .moon, isInOrbit: true)}
    static func Janus() -> LocationWithOrbitData {LocationWithOrbitData(name: "Janus", type: .moon, isInOrbit: true)}
    static func Enceladus() -> LocationWithOrbitData {LocationWithOrbitData(name: "Enceladus", type: .moon, isInOrbit: true)}
    static func Hyperion() -> LocationWithOrbitData {LocationWithOrbitData(name: "Hyperion", type: .moon, isInOrbit: true, isBreakOrbitPoint: true)}
    static func Titan() -> LocationWithOrbitData {LocationWithOrbitData(name: "Titan", type: .moon, isInOrbit: true)}

    static func Nereid() -> LocationWithOrbitData {LocationWithOrbitData(name: "Nereid", type: .moon, isInOrbit: true)}
    static func Triton() -> LocationWithOrbitData {LocationWithOrbitData(name: "Triton", type: .moon, isInOrbit: true)}

    static func SolarSpaceDock() -> LocationWithOrbitData {LocationWithOrbitData(name: "Solar Space Dock", type: .spaceDock, fuelRate: 10)}
    static func JupiterSpaceDock() -> LocationWithOrbitData {LocationWithOrbitData(name: "Jupiter Space Dock", type: .spaceDock, isInOrbit: true)}
    static func UranusSpaceDock() -> LocationWithOrbitData {LocationWithOrbitData(name: "Uranus Space Dock", type: .spaceDock, isInOrbit: true)}
    static func SaturnSpaceDock() -> LocationWithOrbitData {LocationWithOrbitData(name: "Saturn Space Dock", type: .spaceDock, isInOrbit: true)}
    static func NeptuneSpaceDock() -> LocationWithOrbitData {LocationWithOrbitData(name: "Neptune Space Dock", type: .spaceDock, isInOrbit: true)}

    static func JupiterResearchLab() -> LocationWithOrbitData {LocationWithOrbitData(name: "Jupiter Research Lab", type: .researchLab, isInOrbit: true)}
    static func UranusResearchLab() -> LocationWithOrbitData {LocationWithOrbitData(name: "Uranus Research Lab", type: .researchLab, isInOrbit: true)}
    static func NeptuneResearchLab() -> LocationWithOrbitData {LocationWithOrbitData(name: "Neptune Research Lab", type: .researchLab, isInOrbit: true)}
    static func VenusResearchLab() -> LocationWithOrbitData {LocationWithOrbitData(name: "Venus Research Lab", type: .researchLab, isInOrbit: true)}
    static func SaturnResearchLab() -> LocationWithOrbitData {LocationWithOrbitData(name: "Saturn Research Lab", type: .researchLab, isInOrbit: true)}
    static func EarthResearchLab() -> LocationWithOrbitData {LocationWithOrbitData(name: "Earth Research Lab", type: .researchLab)}

    static func FederationStationI() -> LocationWithOrbitData {LocationWithOrbitData(name: "Federation Station I", type: .federationStation)}
    static func FederationStationII() -> LocationWithOrbitData {LocationWithOrbitData(name: "Federation Station II", type: .federationStation, isInOrbit: true)}
    static func FederationStationIII() -> LocationWithOrbitData {LocationWithOrbitData(name: "Federation Station III", type: .federationStation)}
    static func FederationStationIV() -> LocationWithOrbitData {LocationWithOrbitData(name: "Federation Station IV", type: .federationStation, isInOrbit: true)}
    static func FederationStationV() -> LocationWithOrbitData {LocationWithOrbitData(name: "Federation Station V", type: .federationStation)}
    static func FederationStationVI() -> LocationWithOrbitData {LocationWithOrbitData(name: "Federation Station VI", type: .federationStation, isInOrbit: true)}
    static func FederationStationVII() -> LocationWithOrbitData {LocationWithOrbitData(name: "Federation Station VII", type: .federationStation, isInOrbit: true)}
    static func FederationStationVIII() -> LocationWithOrbitData {LocationWithOrbitData(name: "Federation Station VIII", type: .federationStation)}
    static func FederationStationIX() -> LocationWithOrbitData {LocationWithOrbitData(name: "Federation Station IX", type: .federationStation, isInOrbit: true)}


}
