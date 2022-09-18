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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(productService: ProductService())
    }
}
