import Foundation

struct Product: Identifiable {
    let id: String
    let name: String
    let description: String
    let price: Int
    let imageName: ImageIdentifier
}

enum ImageIdentifier: String {
    case pen = "pen"
    case iphone = "iphone"
    case coin = "coin"
}