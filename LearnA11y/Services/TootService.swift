import Foundation

class TootService {
    private let toots: [Toot]
    private let responses: [Toot]
    
    init() {
        self.toots = [
            .init(id: "1", post: "This is a test toot! #helloWorld", author: "@tootorial"),
            .init(id: "2", post: "I love test toots! #helloMastodon", author: "@tootorial87"),
            .init(id: "3", post: "Hi, I'm Lars. I'm an iOS dev learning accessibility! #introduction", author: "@n_develop"),
        ]
        
        self.responses = [
            .init(id: "4", post: "I agree. 100%. That's it!", author: "@tootorial13"),
            .init(id: "5", post: "Love it. #sorryNotSorry", author: "@tootorial_94"),
            .init(id: "6", post: "WHAT? Are you sure? I'm shocked!", author: "@tootorial87_31"),
        ]
    }
    
    func getToots() -> [Toot] {
        toots
    }
    
    func getResponses() -> [Toot] {
        responses
    }
}
