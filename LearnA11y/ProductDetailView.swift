import Foundation
import SwiftUI

struct ProductDetailView: View {
    @State private var useDiscount: Bool = false
    @State private var showSheet: Bool = false
    let product: Product

    var price: Int {
        useDiscount ? Int(Double(product.price) * 0.8) : product.price
    }

    var body: some View {
        VStack {
            Text(product.name)
                .font(.largeTitle)
            Image(product.imageName.rawValue)
                .resizable()
                .frame(maxWidth: 200, maxHeight: 300)

            Spacer()
            Text(product.description)
            Spacer()
            Toggle(isOn: $useDiscount) {
                Text("Use discount")
            }
            Text("Price: $\(price)")
                .font(.title)
            Spacer()
            Button {
                showSheet = true
            } label: {
                Text("Buy now")
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .sheet(isPresented: $showSheet) {
                VStack{
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 110))
                        .foregroundColor(.green)

                    Text("Thanks for your purchase!")
                        .font(.title)
                }
            }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(
            id: "1",
            name: "A proper pen",
            description: "The says it all. It's a proper pen.",
            price: 160,
            imageName: ImageIdentifier.pen,
            onSale: true
        )
        return ProductDetailView(product: product)
    }
}
