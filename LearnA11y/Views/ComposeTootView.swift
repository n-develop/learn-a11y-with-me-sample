import SwiftUI

struct ComposeTootView: View {
    var sendToot: (String) -> ()
    @State var toot: String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            TextField("Your toot goes here...", text: $toot)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Toot!") {
                sendToot(toot)
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
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
