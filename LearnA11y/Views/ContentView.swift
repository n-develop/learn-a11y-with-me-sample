import SwiftUI
import Foundation

struct ContentView: View {
    @State private var showReponses: Bool = false
    @State private var showComposeSheet: Bool = false
    @State var activeToot: Toot? = nil
    let tootService: TootService
    
    var body: some View {
        
        NavigationView {
            VStack {
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
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    /*
                     * The following Text(...) is a bad workaround for a
                     * bad SwiftUI bug. Please ignore it.
                     * It keeps the toolbar item tappable after dismissing the sheet
                     * https://stackoverflow.com/questions/58512344/swiftui-navigation-bar-button-not-clickable-after-sheet-has-been-presented/69271504#69271504
                     */
                    Text(showComposeSheet ? " " : "").hidden()
                    Button("+") {
                        showComposeSheet = true
                    }
                    .font(.title)
                }
                ToolbarItem(placement: .principal) {
                    HStack (spacing: 0){
                        Text("Toot")
                            .bold()
                            .italic()
                        Text("orial 🐘")
                    }
                    .font(.title)
                }
            }
            .sheet(item: $activeToot, content: { toot in
                ThreadView(toot: toot, responses: tootService.getResponses())
            })
            .sheet(isPresented: $showComposeSheet, content: {
                ComposeTootView { tootText in
                    debugPrint("Toot: \(tootText)")
                }
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tootService: TootService())
    }
}
