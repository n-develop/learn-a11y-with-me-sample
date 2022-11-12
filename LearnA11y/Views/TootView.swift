import Foundation
import SwiftUI

struct TootView: View {
    let toot: Toot
    
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundColor(.random)
                    .frame(width: 60, height: 60)
                
                Text(toot.author)
                    .font(.caption)
            }
            VStack(alignment: .leading, spacing: 8) {
                
                Text(toot.post)
                HStack(spacing: 15) {
                    Button {
                        debugPrint("Comment action")
                        // TODO: add "comment" action
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward")
                    }
                    .buttonStyle(.borderless)
                    
                    Button {
                        debugPrint("Boost action")
                        // TODO: add "boost" action
                    } label: {
                        Image(systemName: "repeat")
                    }
                    .buttonStyle(.borderless)
                    
                    Button {
                        debugPrint("Favorite action")
                        // TODO: add "favorite" action
                    } label: {
                        Image(systemName: "star")
                    }
                    .buttonStyle(.borderless)
                }
            }
        }
        .padding(5)
    }
}

struct TootView_Previews: PreviewProvider {
    static var previews: some View {
        let toot = Toot(
            id: "1",
            post: "This is a mastodon post #introduction",
            author: "@tootorial_31"
        )
        return TootView(toot: toot)
            .previewLayout(.sizeThatFits)
    }
}
