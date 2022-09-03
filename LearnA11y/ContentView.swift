import SwiftUI

struct ContentView: View {
    let productService: ProductService
    
    var body: some View {
        ScrollView {
            Text("Awesome Products")
                .font(.largeTitle)
            
            ForEach(productService.getProducts()) { product in
                ProductTeaser(product: product)
            }
            
        }
    }
    
}

struct ProductTeaser: View {
    let product: Product
    
    var body: some View {
        ZStack {
            Image(product.imageName.rawValue)
                .resizable()
                .scaledToFit()
            VStack {
                HStack {
                    Spacer()
                    if product.onSale {
                        HStack(alignment: .center){
                            Image(systemName: "tag.fill")
                            Text("Sale")
                        }
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 1.0, green: 0.5, blue: 0.5, opacity: 0.9))
                        .cornerRadius(30)
                    }
                    Text("$\(product.price)")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 0.2, green: 0.7, blue: 0.7, opacity: 0.9))
                        .cornerRadius(30)
                }
                .padding([.top, .trailing])
                
                Spacer()
                Button {
                    // TODO open PDP
                } label: {
                    Text(product.name)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.5))
                        .cornerRadius(30)
                        .padding(5)
                }
                
            }
        }
    }
}

struct ProductDetailView: View {
    @State private var useDiscount: Bool = false
    var price: Int {
        useDiscount ? 299 : 349
    }
    var body: some View {
        VStack {
            Text("Awesome product")
                .font(.largeTitle)
            Spacer()
            Text("This product is just perfect. It's small, pretty, and very expensive.")
            Spacer()
            Toggle(isOn: $useDiscount) {
                Text("Use discount")
            }
            Text("Price: $\(price)")
                .font(.title)
            Spacer()
            Button {
                // TODO do something
            } label: {
                Text("Buy now")
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(productService: ProductService())
    }
}
