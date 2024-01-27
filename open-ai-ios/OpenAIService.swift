//
//  OpenAiService.swift
//  open-ai-ios
//
//  Created by Frank Anderson on 1/27/24.
//

import SwiftUI
import OpenAI

class OpenAIService: ObservableObject {
    let openAI = OpenAI(configuration: .init(token: "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")) // setup the OpenAI object to handle API usage, using my API token to configure

    func spinHelloWorld() async throws -> String {
        let query = ChatQuery(model: .gpt3_5Turbo, messages: [.init(role: .user, content: "Give a creative spin on 'Hello, world!'")]) // build a query with a the GPT 3.5 Turbo model, and ask for a response to the prompt: "Give me a creative spin on 'Hello, world!'"

        var result = "" // prepare to accumulate the result
        for try await response in openAI.chatsStream(query: query) {
            if let r = response.choices.first?.delta.content {
                result += r
            }
        }

        return result
    }
}
