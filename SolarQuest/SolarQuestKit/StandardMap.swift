public struct StandardMap: Map {
    static func createLocations() -> [Location] {
        [
            StandardMap.Earth(),        // 0
            StandardMap.BlackDot(),
            StandardMap.Moon(),
            StandardMap.SolarSpaceDock(),
            StandardMap.Mercury(),
            StandardMap.FederationStationI(),
            StandardMap.BlueDot(),
            StandardMap.BlueDot(),
            // JUPITER ORBIT:
            StandardMap.Io(),
            StandardMap.JupiterSpaceDock(),
            StandardMap.OrbitalBlueDot(),       // 10
            StandardMap.Elara(),
            StandardMap.Callisto(),
            StandardMap.FederationStationII(),
            StandardMap.Thebe(),
            StandardMap.OrbitalBlueDot(),
            StandardMap.Metis(),
            StandardMap.Ganymede(), // <break orbit point>
            StandardMap.JupiterResearchLab(),
            StandardMap.Himalia(),
            StandardMap.Europa(),               // 20
            StandardMap.Amalthea(),
            StandardMap.Adrastea(),
            // END JUPITER ORBIT
//            StandardMap.Sinope(), // requires special rule
            StandardMap.BlackDot(),
            StandardMap.BlackDot(),
            StandardMap.BlackDot(),
            StandardMap.BlackDot(),
            StandardMap.FederationStationIII(),
            StandardMap.BlueDot(),
            // URANUS ORBIT:
            StandardMap.Miranda(),
            StandardMap.UranusSpaceDock(),
            StandardMap.Umbriel(),
            StandardMap.Oberon(),
            StandardMap._1985U1(),
            StandardMap.UranusResearchLab(),
            StandardMap.OrbitalBlueDot(),
            StandardMap.Ariel(), // <break orbit point>
            StandardMap.FederationStationIV(),
            StandardMap.Titania(),
            // END URANUS ORBIT
            StandardMap.BlackDot(),
            StandardMap.BlackDot(),
            StandardMap.BlackDot(),
            StandardMap.Pluto(),
            StandardMap.Charon(),
            StandardMap.BlueDot(),
            StandardMap.FederationStationV(),
            StandardMap.BlueDot(),
            StandardMap.BlueDot(),
            StandardMap.Phobos(),
            StandardMap.Mars(),
            StandardMap.Deimos(),
            StandardMap.BlueDot(),
            StandardMap.VenusResearchLab(),
            StandardMap.Venus(),
            StandardMap.BlackDot(),
            StandardMap.Phoebe(),
            // SATURN ORBIT:
            StandardMap.Mimas(),
            StandardMap.SaturnSpaceDock(),
            StandardMap.Dione(),
            StandardMap.OrbitalBlueDot(),
            StandardMap.Iapetus(),
            StandardMap.Rhea(),
            StandardMap.Tethys(),
            StandardMap.FederationStationVI(),
            StandardMap.Janus(),
            StandardMap.Enceladus(),
            StandardMap.SaturnResearchLab(),
            StandardMap.Hyperion(), // <break orbit point>
            StandardMap.Titan(),
            StandardMap.FederationStationVII(),
            // END SATURN ORBIT
            StandardMap.BlackDot(),
            StandardMap.BlackDot(),
            StandardMap.BlackDot(),
            StandardMap.BlackDot(),
            StandardMap.FederationStationVIII(),
            StandardMap.BlueDot(),
            // ENTER NEPTUNE ORBIT
            StandardMap.Nereid(),
            StandardMap.OrbitalBlueDot(),
            StandardMap.NeptuneSpaceDock(),
            StandardMap.NeptuneResearchLab(),
            StandardMap.OrbitalBlueDot(),
            StandardMap.Triton(),
            StandardMap.FederationStationIX(),
            StandardMap.OrbitalBlueDotExitPoint(), // break orbit from here
            StandardMap.OrbitalBlueDot(),
            // END NEPTUNE ORBIT
            StandardMap.BlackDot(),
            StandardMap.BlackDot(),
            StandardMap.BlackDot(),
            StandardMap.EarthResearchLab()
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
