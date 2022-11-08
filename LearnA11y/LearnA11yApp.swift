import SwiftUI

@main
struct LearnA11yApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(tootService: TootService())
        }
    }
}
