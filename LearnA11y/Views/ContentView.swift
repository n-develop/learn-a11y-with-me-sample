import SwiftUI
import Foundation

struct ContentView: View {
    @State private var showReponses: Bool = false
    @State var activeToot: Toot? = nil
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
                        .onTapGesture {
                            self.activeToot = toot
                            showReponses = true
                        }
                }
            }
            .background(Color.green)
        }
        .sheet(item: $activeToot, content: { toot in
            ThreadView(toot: toot, responses: [
                .init(id: "2", post: "Hahaha... awesome", author: "@tootorial_810"),
                .init(id: "3", post: "Hahaha... awesome", author: "@tootorial_811"),
                .init(id: "4", post: "Hahaha... awesome", author: "@tootorial_812")
            ])
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tootService: TootService())
    }
}
