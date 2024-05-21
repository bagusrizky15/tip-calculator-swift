import UIKit

let point = 75

switch point {
case 0...50 :
    print("Grade D")
case 51...70 :
    print("Grade C")
case 71...80 :
    print("Grade B")
case 81...100 :
    print("Grade A")
default :
    print("null")
}
