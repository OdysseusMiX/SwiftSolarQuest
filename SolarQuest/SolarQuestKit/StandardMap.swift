struct StandardMap: Map {
    static func listLocations(in data: MapData) -> [MutableLocation] {
        return GenericMap.listLocations(in: data)
    }
    static func listConnections(in data: MapData) -> [[Int]] {
        return GenericMap.listConnections(in: data)
    }


    static func createMap() -> [(MutableLocation, [Int])] {
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
    
    static func BlackDot() -> MutableLocation {MutableLocation(name: "Gravity Well", type: .blackDot)}
    static func BlueDot() -> MutableLocation {MutableLocation(name: "Drifting", type: .blueDot)}
    static func OrbitalBlueDot() -> MutableLocation {MutableLocation(name: "Drifting", type: .blueDot, isInOrbit: true)}
    static func OrbitalBlueDotExitPoint() -> MutableLocation {MutableLocation(name: "Drifting", type: .blueDot, isInOrbit: true, isBreakOrbitPoint: true)}

    static func Earth() -> MutableLocation {MutableLocation(name: "Earth", type: .planet, hasFuel: true, fuelRate: 25)}
    static func Moon() -> MutableLocation { MutableLocation(name: "Moon", type: .moon)}
    static func Mercury() -> MutableLocation { MutableLocation(name: "Mercury", type: .planet)}

    static func Io() -> MutableLocation {MutableLocation(name: "Io", type: .moon, isInOrbit: true)}
    static func Elara() -> MutableLocation {MutableLocation(name: "Elara", type: .moon, isInOrbit: true)}
    static func Callisto() -> MutableLocation {MutableLocation(name: "Callisto", type: .moon, isInOrbit: true)}
    static func Thebe() -> MutableLocation {MutableLocation(name: "Thebe", type: .moon, isInOrbit: true)}
    static func Metis() -> MutableLocation {MutableLocation(name: "Metis", type: .moon, isInOrbit: true)}
    static func Ganymede() -> MutableLocation {MutableLocation(name: "Ganymede", type: .moon, isInOrbit: true, isBreakOrbitPoint: true)}
    static func Himalia() -> MutableLocation {MutableLocation(name: "Himalia", type: .moon, isInOrbit: true)}
    static func Europa() -> MutableLocation {MutableLocation(name: "Europa", type: .moon, isInOrbit: true)}
    static func Amalthea() -> MutableLocation {MutableLocation(name: "Amalthea", type: .moon, isInOrbit: true)}
    static func Adrastea() -> MutableLocation {MutableLocation(name: "Adrastea", type: .moon, isInOrbit: true)}
    static func Sinope() -> MutableLocation {MutableLocation(name: "Sinope", type: .moon)}
    
    static func Miranda() -> MutableLocation {MutableLocation(name: "Miranda", type: .moon, isInOrbit: true)}
    static func Umbriel() -> MutableLocation {MutableLocation(name: "Umbriel", type: .moon, isInOrbit: true)}
    static func Oberon() -> MutableLocation {MutableLocation(name: "Oberon", type: .moon, isInOrbit: true)}
    static func _1985U1() -> MutableLocation {MutableLocation(name: "1985 U1", type: .moon, isInOrbit: true)}
    static func Ariel() -> MutableLocation {MutableLocation(name: "Ariel", type: .moon, isInOrbit: true, isBreakOrbitPoint: true)}
    static func Titania() -> MutableLocation {MutableLocation(name: "Titania", type: .moon, isInOrbit: true)}

    static func Pluto() -> MutableLocation { MutableLocation(name: "Pluto", type: .planet)}
    static func Charon() -> MutableLocation { MutableLocation(name: "Charon", type: .moon)}

    static func Phobos() -> MutableLocation { MutableLocation(name: "Phobos", type: .moon)}
    static func Mars() -> MutableLocation { MutableLocation(name: "Mars", type: .planet)}
    static func Deimos() -> MutableLocation { MutableLocation(name: "Deimos", type: .moon)}

    static func Venus() -> MutableLocation { MutableLocation(name: "Venus", type: .planet)}

    static func Phoebe() -> MutableLocation {MutableLocation(name: "Phoebe", type: .moon)}
    static func Mimas() -> MutableLocation {MutableLocation(name: "Mimas", type: .moon, isInOrbit: true)}
    static func Dione() -> MutableLocation {MutableLocation(name: "Dione", type: .moon, isInOrbit: true)}
    static func Iapetus() -> MutableLocation {MutableLocation(name: "Iapetus", type: .moon, isInOrbit: true)}
    static func Rhea() -> MutableLocation {MutableLocation(name: "Rhea", type: .moon, isInOrbit: true)}
    static func Tethys() -> MutableLocation {MutableLocation(name: "Tethys", type: .moon, isInOrbit: true)}
    static func Janus() -> MutableLocation {MutableLocation(name: "Janus", type: .moon, isInOrbit: true)}
    static func Enceladus() -> MutableLocation {MutableLocation(name: "Enceladus", type: .moon, isInOrbit: true)}
    static func Hyperion() -> MutableLocation {MutableLocation(name: "Hyperion", type: .moon, isInOrbit: true, isBreakOrbitPoint: true)}
    static func Titan() -> MutableLocation {MutableLocation(name: "Titan", type: .moon, isInOrbit: true)}

    static func Nereid() -> MutableLocation {MutableLocation(name: "Nereid", type: .moon, isInOrbit: true)}
    static func Triton() -> MutableLocation {MutableLocation(name: "Triton", type: .moon, isInOrbit: true)}

    static func SolarSpaceDock() -> MutableLocation {MutableLocation(name: "Solar Space Dock", type: .spaceDock, hasFuel: true, fuelRate: 10)}
    static func JupiterSpaceDock() -> MutableLocation {MutableLocation(name: "Jupiter Space Dock", type: .spaceDock, isInOrbit: true, hasFuel: true)}
    static func UranusSpaceDock() -> MutableLocation {MutableLocation(name: "Uranus Space Dock", type: .spaceDock, isInOrbit: true, hasFuel: true)}
    static func SaturnSpaceDock() -> MutableLocation {MutableLocation(name: "Saturn Space Dock", type: .spaceDock, isInOrbit: true, hasFuel: true)}
    static func NeptuneSpaceDock() -> MutableLocation {MutableLocation(name: "Neptune Space Dock", type: .spaceDock, isInOrbit: true, hasFuel: true)}

    static func JupiterResearchLab() -> MutableLocation {MutableLocation(name: "Jupiter Research Lab", type: .researchLab, isInOrbit: true)}
    static func UranusResearchLab() -> MutableLocation {MutableLocation(name: "Uranus Research Lab", type: .researchLab, isInOrbit: true)}
    static func NeptuneResearchLab() -> MutableLocation {MutableLocation(name: "Neptune Research Lab", type: .researchLab, isInOrbit: true)}
    static func VenusResearchLab() -> MutableLocation {MutableLocation(name: "Venus Research Lab", type: .researchLab, isInOrbit: true)}
    static func SaturnResearchLab() -> MutableLocation {MutableLocation(name: "Saturn Research Lab", type: .researchLab, isInOrbit: true)}
    static func EarthResearchLab() -> MutableLocation {MutableLocation(name: "Earth Research Lab", type: .researchLab)}

    static func FederationStationI() -> MutableLocation {MutableLocation(name: "Federation Station I", type: .federationStation)}
    static func FederationStationII() -> MutableLocation {MutableLocation(name: "Federation Station II", type: .federationStation, isInOrbit: true)}
    static func FederationStationIII() -> MutableLocation {MutableLocation(name: "Federation Station III", type: .federationStation)}
    static func FederationStationIV() -> MutableLocation {MutableLocation(name: "Federation Station IV", type: .federationStation, isInOrbit: true)}
    static func FederationStationV() -> MutableLocation {MutableLocation(name: "Federation Station V", type: .federationStation)}
    static func FederationStationVI() -> MutableLocation {MutableLocation(name: "Federation Station VI", type: .federationStation, isInOrbit: true)}
    static func FederationStationVII() -> MutableLocation {MutableLocation(name: "Federation Station VII", type: .federationStation, isInOrbit: true)}
    static func FederationStationVIII() -> MutableLocation {MutableLocation(name: "Federation Station VIII", type: .federationStation)}
    static func FederationStationIX() -> MutableLocation {MutableLocation(name: "Federation Station IX", type: .federationStation, isInOrbit: true)}


}
