import Foundation

class TootService {
    private var toots: [Toot]
    private let responses: [Toot]
    
    init() {
        self.toots = [
            .init(id: "1", post: "This is a test toot! #helloWorld", author: "@tootorial01"),
            .init(id: "2", post: "I love test toots! #helloMastodon", author: "@tootorial87"),
            .init(id: "3", post: "Hi, I'm Lars. I'm an iOS dev learning accessibility! #introduction", author: "@n_develop"),
        ]
        
        self.responses = [
            .init(id: "4", post: "I agree. 100%. That's it!", author: "@tootorial62"),
            .init(id: "5", post: "Love it. #sorryNotSorry", author: "@tootorial94"),
            .init(id: "6", post: "WHAT? Are you sure? I'm shocked!", author: "@tootorial83"),
        ]
    }
    
    func post(text: String) {
        toots.append(Toot(id: UUID().uuidString, post: text, author: "@me"))
    }
    
    func getToots() -> [Toot] {
        toots
    }
    
    func getResponses() -> [Toot] {
        responses
    }
}
