import UIKit

// Enum yang merepresentasikan kemungkinan kesalahan pada kata sandi
enum PasswordError: Error {
    case obvious
}

// Fungsi untuk memeriksa keamanan kata sandi
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        // Jika kata sandi terlalu jelas, lemparkan kesalahan PasswordError.obvious
        throw PasswordError.obvious
    }

    // Jika kata sandi aman, kembalikan true
    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}
