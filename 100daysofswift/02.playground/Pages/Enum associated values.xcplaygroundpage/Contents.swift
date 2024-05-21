import UIKit

enum Activity {
    case bored
    case talking(topic: String)
    case singing(volume: Int)
}

let denis = Activity.singing(volume: 90)
let hana = Activity.talking(topic: "food")
