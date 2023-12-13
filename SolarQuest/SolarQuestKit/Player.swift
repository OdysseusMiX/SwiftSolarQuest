public class Player {
    public var name : String
    public var hydrons : Int = 25
    public var unplacedFuelStations = 3
    public var status : Player.Status = .playing
    public var federons : Int = 3*(500+100+50+10+5)
    public var debt : [IOU] = [IOU]()
    
    init(name: String = "") {
        self.name = name
    }
    
    public enum Status {
        case playing
        case outOfTheGame
    }
    public struct IOU : Equatable {
        let owe: Int
        let toPlayer: Int
    }
}
