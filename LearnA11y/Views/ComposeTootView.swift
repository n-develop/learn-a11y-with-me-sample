import SwiftUI

struct ComposeTootView: View {
    var sendToot: (String) -> ()
    @State var toot: String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Image(systemName: "square.and.pencil")
                .resizable()
                .frame(width: 50, height: 50)
            TextField("Your toot goes here...", text: $toot)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Toot!") {
                sendToot(toot)
                presentationMode.wrappedValue.dismiss()
            }
            .padding(.horizontal, 50)
            .padding(.vertical, 10)
            .background {
                Color.blue
            }
            .foregroundColor(.white)
            .cornerRadius(30)
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    @State static var content: String = ""
    static var previews: some View {
        ComposeTootView { tootText in
            debugPrint("Toot: \(tootText)")
        }
    }
}
