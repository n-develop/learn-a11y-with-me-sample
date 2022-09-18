import SwiftUI

struct ContentView: View {
    let productService: ProductService
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(productService.getProducts()) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        ProductTeaser(product: product)
                    }


                }
            }
            .navigationTitle("Awesome Products")
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

struct ProductDetailView: View {
    @State private var useDiscount: Bool = false

    let product: Product

    var price: Int {
        useDiscount ? Int(Double(product.price) * 0.8) : product.price
    }

    var body: some View {
        VStack {
            Text(product.name)
                .font(.largeTitle)
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
