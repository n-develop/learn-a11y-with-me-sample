import Foundation

class ProductService {
    private let products: [Product]
    
    init() {
        self.products = [
            .init(
                id: "1",
                name: "iPhone SE",
                description: "This is a beautiful 1. Generation iPhone SE. Fits in every pocket",
                price: 99,
                imageName: .iphone,
                onSale: true
            ),
            .init(
                id: "2",
                name: "2 Euros",
                description: "This is an awesome coin. It has a vintage look, but is still a modern payment method",
                price: 5,
                imageName: .coin,
                onSale: false
            ),
            .init(
                id: "3",
                name: "A proper pen",
                description: "The name says it all. It's a proper pen.",
                price: 160,
                imageName: .pen,
                onSale: true
            )
        ]
    }
    
    func getProducts() -> [Product] {
        products
    }
}
