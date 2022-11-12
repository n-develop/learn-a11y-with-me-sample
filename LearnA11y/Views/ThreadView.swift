import SwiftUI

struct ThreadView: View {
    let toot: Toot
    let responses: [Toot]
    
    var body: some View {
        List {
            TootView(toot: toot)
            ForEach(responses) { response in
                HStack {
                    Image(systemName: "arrow.turn.down.right")
                        .font(.title)
                    TootView(toot: response)
                }
            }
        }
        .navigationTitle("Thread")
        
    }
}

struct ThreadView_Previews: PreviewProvider {
    static var previews: some View {
        let toot = Toot(
            id: "1",
            post: "This is a toot",
            author: "@n_develop"
        )
        let responses: [Toot] = [
            .init(id: "2", post: "Hahaha... awesome", author: "@tootorial_810"),
            .init(id: "3", post: "Hahaha... awesome", author: "@tootorial_811"),
            .init(id: "4", post: "Hahaha... awesome", author: "@tootorial_812")
        ]
        return ThreadView(toot: toot, responses: responses)
    }
}
