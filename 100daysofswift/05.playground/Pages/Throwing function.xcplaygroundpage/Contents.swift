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

// Coba memeriksa sebuah kata sandi
do {
    let password = "password" // Kata sandi yang akan diperiksa
    let isSecure = try checkPassword(password)
    print("Kata sandi aman:", isSecure)
} catch PasswordError.obvious {
    print("Kata sandi terlalu jelas!")
} catch {
    print("Kesalahan lain:", error)
}
