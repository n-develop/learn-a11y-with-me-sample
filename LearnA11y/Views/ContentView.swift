import SwiftUI
import Foundation

struct ContentView: View {
    @State private var showInputSheet: Bool = false
    let tootService: TootService
    
    var body: some View {
        
        VStack {
            HStack (spacing: 0){
                Text("Toot")
                    .bold()
                    .italic()
                Text("orial 🐘")
            }
            .font(.title)
            
            List {
                ForEach(tootService.getToots()) { toot in
                    TootView(toot: toot)
                }
            }
            .background(Color.green)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tootService: TootService())
    }
}
