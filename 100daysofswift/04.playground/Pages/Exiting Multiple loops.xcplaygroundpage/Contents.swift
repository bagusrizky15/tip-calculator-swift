import UIKit

outerLoop : for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")
        if i == 5 {
            break outerLoop
        }
    }
}
