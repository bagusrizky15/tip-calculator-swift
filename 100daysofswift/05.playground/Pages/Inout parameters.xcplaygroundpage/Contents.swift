import UIKit

func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNumber = 5
print("Before doubling:", myNumber) // Output: Before doubling: 5

doubleInPlace(number: &myNumber) // Memanggil fungsi doubleInPlace dengan menggunakan '&', karena parameter berupa 'inout'
print("After doubling:", myNumber) // Output: After doubling: 10

