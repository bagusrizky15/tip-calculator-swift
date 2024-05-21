import UIKit

func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel {
    "I'm going to \($0) in my car"
}
