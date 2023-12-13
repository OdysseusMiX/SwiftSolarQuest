public struct StandardMap: Map {
    static func listLocations(in data: MapData) -> [Location] {
        return GenericMap.listLocations(in: data)
    }
    static func listConnections(in data: MapData) -> [[Int]] {
        return GenericMap.listConnections(in: data)
    }


    static func createMap() -> [(Location, [Int])] {
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
    
    public static func BlackDot() -> Location {Location(name: "Gravity Well", type: .blackDot)}
    public static func BlueDot() -> Location {Location(name: "Drifting", type: .blueDot)}
    public static func OrbitalBlueDot() -> Location {Location(name: "Drifting", type: .blueDot, isInOrbit: true)}
    public static func OrbitalBlueDotExitPoint() -> Location {Location(name: "Drifting", type: .blueDot, isInOrbit: true, isBreakOrbitPoint: true)}

    public static func Earth() -> Location {Location(name: "Earth", type: .planet, hasFuel: true, fuelRate: 25)}
    public static func Moon() -> Location { Location(name: "Moon", type: .moon)}
    public static func Mercury() -> Location { Location(name: "Mercury", type: .planet)}

    public static func Io() -> Location {Location(name: "Io", type: .moon, isInOrbit: true)}
    public static func Elara() -> Location {Location(name: "Elara", type: .moon, isInOrbit: true)}
    public static func Callisto() -> Location {Location(name: "Callisto", type: .moon, isInOrbit: true)}
    public static func Thebe() -> Location {Location(name: "Thebe", type: .moon, isInOrbit: true)}
    public static func Metis() -> Location {Location(name: "Metis", type: .moon, isInOrbit: true)}
    public static func Ganymede() -> Location {Location(name: "Ganymede", type: .moon, isInOrbit: true, isBreakOrbitPoint: true)}
    public static func Himalia() -> Location {Location(name: "Himalia", type: .moon, isInOrbit: true)}
    public static func Europa() -> Location {Location(name: "Europa", type: .moon, isInOrbit: true)}
    public static func Amalthea() -> Location {Location(name: "Amalthea", type: .moon, isInOrbit: true)}
    public static func Adrastea() -> Location {Location(name: "Adrastea", type: .moon, isInOrbit: true)}
    public static func Sinope() -> Location {Location(name: "Sinope", type: .moon)}
    
    public static func Miranda() -> Location {Location(name: "Miranda", type: .moon, isInOrbit: true)}
    public static func Umbriel() -> Location {Location(name: "Umbriel", type: .moon, isInOrbit: true)}
    public static func Oberon() -> Location {Location(name: "Oberon", type: .moon, isInOrbit: true)}
    public static func _1985U1() -> Location {Location(name: "1985 U1", type: .moon, isInOrbit: true)}
    public static func Ariel() -> Location {Location(name: "Ariel", type: .moon, isInOrbit: true, isBreakOrbitPoint: true)}
    public static func Titania() -> Location {Location(name: "Titania", type: .moon, isInOrbit: true)}

    public static func Pluto() -> Location { Location(name: "Pluto", type: .planet)}
    public static func Charon() -> Location { Location(name: "Charon", type: .moon)}

    public static func Phobos() -> Location { Location(name: "Phobos", type: .moon)}
    public static func Mars() -> Location { Location(name: "Mars", type: .planet)}
    public static func Deimos() -> Location { Location(name: "Deimos", type: .moon)}

    public static func Venus() -> Location { Location(name: "Venus", type: .planet)}

    public static func Phoebe() -> Location {Location(name: "Phoebe", type: .moon)}
    public static func Mimas() -> Location {Location(name: "Mimas", type: .moon, isInOrbit: true)}
    public static func Dione() -> Location {Location(name: "Dione", type: .moon, isInOrbit: true)}
    public static func Iapetus() -> Location {Location(name: "Iapetus", type: .moon, isInOrbit: true)}
    public static func Rhea() -> Location {Location(name: "Rhea", type: .moon, isInOrbit: true)}
    public static func Tethys() -> Location {Location(name: "Tethys", type: .moon, isInOrbit: true)}
    public static func Janus() -> Location {Location(name: "Janus", type: .moon, isInOrbit: true)}
    public static func Enceladus() -> Location {Location(name: "Enceladus", type: .moon, isInOrbit: true)}
    public static func Hyperion() -> Location {Location(name: "Hyperion", type: .moon, isInOrbit: true, isBreakOrbitPoint: true)}
    public static func Titan() -> Location {Location(name: "Titan", type: .moon, isInOrbit: true)}

    public static func Nereid() -> Location {Location(name: "Nereid", type: .moon, isInOrbit: true)}
    public static func Triton() -> Location {Location(name: "Triton", type: .moon, isInOrbit: true)}

    public static func SolarSpaceDock() -> Location {Location(name: "Solar Space Dock", type: .spaceDock, hasFuel: true, fuelRate: 10)}
    public static func JupiterSpaceDock() -> Location {Location(name: "Jupiter Space Dock", type: .spaceDock, isInOrbit: true, hasFuel: true)}
    public static func UranusSpaceDock() -> Location {Location(name: "Uranus Space Dock", type: .spaceDock, isInOrbit: true, hasFuel: true)}
    public static func SaturnSpaceDock() -> Location {Location(name: "Saturn Space Dock", type: .spaceDock, isInOrbit: true, hasFuel: true)}
    public static func NeptuneSpaceDock() -> Location {Location(name: "Neptune Space Dock", type: .spaceDock, isInOrbit: true, hasFuel: true)}

    public static func JupiterResearchLab() -> Location {Location(name: "Jupiter Research Lab", type: .researchLab, isInOrbit: true)}
    public static func UranusResearchLab() -> Location {Location(name: "Uranus Research Lab", type: .researchLab, isInOrbit: true)}
    public static func NeptuneResearchLab() -> Location {Location(name: "Neptune Research Lab", type: .researchLab, isInOrbit: true)}
    public static func VenusResearchLab() -> Location {Location(name: "Venus Research Lab", type: .researchLab, isInOrbit: true)}
    public static func SaturnResearchLab() -> Location {Location(name: "Saturn Research Lab", type: .researchLab, isInOrbit: true)}
    public static func EarthResearchLab() -> Location {Location(name: "Earth Research Lab", type: .researchLab)}

    public static func FederationStationI() -> Location {Location(name: "Federation Station I", type: .federationStation)}
    public static func FederationStationII() -> Location {Location(name: "Federation Station II", type: .federationStation, isInOrbit: true)}
    public static func FederationStationIII() -> Location {Location(name: "Federation Station III", type: .federationStation)}
    public static func FederationStationIV() -> Location {Location(name: "Federation Station IV", type: .federationStation, isInOrbit: true)}
    public static func FederationStationV() -> Location {Location(name: "Federation Station V", type: .federationStation)}
    public static func FederationStationVI() -> Location {Location(name: "Federation Station VI", type: .federationStation, isInOrbit: true)}
    public static func FederationStationVII() -> Location {Location(name: "Federation Station VII", type: .federationStation, isInOrbit: true)}
    public static func FederationStationVIII() -> Location {Location(name: "Federation Station VIII", type: .federationStation)}
    public static func FederationStationIX() -> Location {Location(name: "Federation Station IX", type: .federationStation, isInOrbit: true)}


}
