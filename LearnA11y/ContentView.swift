import SwiftUI

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

struct TootView: View {
    let toot: Toot
    
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                Text(toot.author)
                    .font(.caption)
            }
            VStack(alignment: .leading, spacing: 8) {
                
                Text(toot.post)
                HStack(spacing: 15) {
                    Button {
                        // TODO: add "comment" action
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward")
                    }
                    Button {
                        // TODO: add "boost" action
                    } label: {
                        Image(systemName: "repeat")
                    }
                    Button {
                        // TODO: add "favorite" action
                    } label: {
                        Image(systemName: "star")
                    }
                }
            }
        }
        .padding(5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tootService: TootService())
    }
}
