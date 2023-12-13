class Player {
    var name : String
    var hydrons : Int = 25
    var unplacedFuelStations = 3
    var status : Player.Status = .playing
    var federons : Int = 3*(500+100+50+10+5)
    var debt : [IOU] = [IOU]()
    
    init(name: String = "") {
        self.name = name
    }
    
    enum Status {
        case playing
        case outOfTheGame
    }
    struct IOU : Equatable {
        let owe: Int
        let toPlayer: Int
    }
}
