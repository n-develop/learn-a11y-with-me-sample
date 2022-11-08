import Foundation

class TootService {
    private let toots: [Toot]
    
    init() {
        self.toots = [
            .init(id: "1", post: "This is a test toot! #helloWorld", author: "@tootorial"),
            .init(id: "2", post: "I love test toots! #helloMastodon", author: "@tootorial87"),
            .init(id: "3", post: "Hi, I'm Lars. I'm an iOS dev learning accessibility! #introduction", author: "@n_develop"),
        ]
    }
    
    func getToots() -> [Toot] {
        toots
    }
}
