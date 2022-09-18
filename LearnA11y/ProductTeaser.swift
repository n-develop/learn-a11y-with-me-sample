import Foundation
import SwiftUI

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
