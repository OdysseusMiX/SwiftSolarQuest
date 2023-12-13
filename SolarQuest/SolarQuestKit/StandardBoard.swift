class StandardBoard : Board {
    
    var playerPositions = [Int]()
    var numberOfPlayers : Int { playerPositions.count }
    
    let locations : [Location]
    let connections: [[Int]]
    
    init(numberOfPlayers: Int = 1) {
        let n = numberOfPlayers >= 1 ? numberOfPlayers : 1
        
        for _ in 1...n {
            self.playerPositions.append(0)
        }
        
        let mapData = StandardBoard.map()
        self.locations = mapData.reduce([Location](), { (prior, arg1) -> [Location] in
            var result = prior
            let (location, _) = arg1
            result.append(location)
            return result
        })
        self.connections = mapData.reduce([[Int]](), { (prior, arg1) -> [[Int]] in
            let (_, connection) = arg1
            var result = prior
            result.append(connection)
            return result
        })
    }
    
    func positionOfPlayer(_ n: Int) -> Int {
        playerPositions[n-1]
    }
    
    func place(player index: Int, at position: Int) {
        guard index >= 1, index <= numberOfPlayers else {return}
        guard position >= 0, position < locations.count else {return}
        
        playerPositions[index-1] = position
    }
        
    static func map() -> [(Location, [Int])] {
        [
            (StandardLocations.Earth(), [1]),    // 0
            (StandardLocations.BlackDot(), [2]),
            (StandardLocations.Moon(), [3]),
            (StandardLocations.SolarSpaceDock(), [4]),
            (StandardLocations.Mercury(), [5]),
            (StandardLocations.FederationStation1(), [6]),
            (StandardLocations.BlueDot(), [7]),
            (StandardLocations.BlueDot(), [8]),
            // JUPITER ORBIT:
            (StandardLocations.Io(), [9]),
            (StandardLocations.JupiterSpaceDock(), [10]),
            (StandardLocations.BlueDot(),  [11]),      // 10
            (StandardLocations.Elara(), [12]),
            (StandardLocations.Callisto(), [13]),
            (StandardLocations.FederationStation2(), [14]),
            (StandardLocations.Thebe(), [15]),
            (StandardLocations.BlueDot(), [16]),
            (StandardLocations.Metis(), [17]),
            (StandardLocations.Ganymede(),  [23, 18]),// <break orbit point>
            (StandardLocations.JupiterResearchLab(), [19]),
            (StandardLocations.Himalia(), [20]),
            (StandardLocations.Europa(), [21]),               // 20
            (StandardLocations.Amalthea(), [22]),
            (StandardLocations.Adrastea(), [8]),
            // END JUPITER ORBIT
            (StandardLocations.Sinope(), [24]), // requires special rule
            (StandardLocations.BlackDot(), [25]),
            (StandardLocations.BlackDot(), [26]),
            (StandardLocations.BlackDot(), [27]),
            (StandardLocations.BlackDot(), [28]),
            (StandardLocations.FederationStation3(), [29]),
            (StandardLocations.BlueDot(), [30]),
//            // URANUS ORBIT:
            (StandardLocations.Miranda(), [31]), // 30
            (StandardLocations.UranusSpaceDock(), [32]),
            (StandardLocations.Umbriel(), [33]),
            (StandardLocations.Oberon(), [34]),
            (StandardLocations._1985U1(), [35]),
            (StandardLocations.UranusResearchLab(), [36]),
            (StandardLocations.BlueDot(), [37]),
            (StandardLocations.Ariel(), [40, 38]), // <break orbit point>
            (StandardLocations.FederationStation4(), [39]),
            (StandardLocations.Titania(), [30]),
//            // END URANUS ORBIT
            (StandardLocations.BlackDot(), [41]),  // 40
            (StandardLocations.BlackDot(), [42]),
            (StandardLocations.BlackDot(), [43]),
            (StandardLocations.Pluto(), [44]),
            (StandardLocations.Charon(), [45]),
            (StandardLocations.BlueDot(), [46]),
            (StandardLocations.FederationStation5(), [47]),
            (StandardLocations.BlueDot(), [48]),
            (StandardLocations.BlueDot(), [49]),
            (StandardLocations.Phobos(), [50]),
            (StandardLocations.Mars(), [51]),       // 50
            (StandardLocations.Deimos(), [52]),
            (StandardLocations.BlueDot(), [53]),
            (StandardLocations.VenusResearchLab(), [54]),
            (StandardLocations.Venus(), [55]),
            (StandardLocations.BlackDot(), [56]),
            (StandardLocations.Phoebe(), [57]),
//            // SATURN ORBIT:
            (StandardLocations.Mimas(), [58]),
            (StandardLocations.SaturnSpaceDock(), [59]),
            (StandardLocations.Dione(), [60]),
            (StandardLocations.BlueDot(), [61]),     // 60
            (StandardLocations.Iapetus(), [62]),
            (StandardLocations.Rhea(), [63]),
            (StandardLocations.Tethys(), [64]),
            (StandardLocations.FederationStation6(), [65]),
            (StandardLocations.Janus(), [66]),
            (StandardLocations.Enceladus(), [67]),
            (StandardLocations.SaturnResearchLab(), [68]),
            (StandardLocations.Hyperion(), [71, 69]), // <break orbit point>
            (StandardLocations.Titan(), [70]),
            (StandardLocations.FederationStation7(), [57]),     // 70
//            // END SATURN ORBIT
            (StandardLocations.BlackDot(), [72]),
            (StandardLocations.BlackDot(), [73]),
            (StandardLocations.BlackDot(), [74]),
            (StandardLocations.BlackDot(), [75]),
            (StandardLocations.FederationStation8(), [76]),
            (StandardLocations.BlueDot(), [77]),
//            // ENTER NEPTUNE ORBIT
            (StandardLocations.Nereid(), [78]),
            (StandardLocations.BlueDot(), [79]),
            (StandardLocations.NeptuneSpaceDock(), [80]),
            (StandardLocations.NeptuneResearchLab(), [81]),     // 80
            (StandardLocations.BlueDot(), [82]),
            (StandardLocations.Triton(), [83]),
            (StandardLocations.FederationStation9(), [84]),
            (StandardLocations.BlueDot(), [86, 85]), // break orbit from here
            (StandardLocations.BlueDot(), [77]),
//            // END NEPTUNE ORBIT
            (StandardLocations.BlackDot(), [87]),
            (StandardLocations.BlackDot(), [88]),
            (StandardLocations.BlackDot(), [89]),
            (StandardLocations.EarthResearchLab(), [0])   // 89
        ]
    }
}
