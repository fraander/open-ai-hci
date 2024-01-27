//
//  OpenAiService.swift
//  open-ai-ios
//
//  Created by Frank Anderson on 1/27/24.
//

import SwiftUI
import OpenAI


// Hold onto the different API functions and the configuration
class OpenAIService: ObservableObject {
    let openAI = OpenAI(configuration: .init(token: "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")) // setup the OpenAI object to handle API usage, using my API token to configure

    // Query the API to give a new version of hello world. This function is asynchronous and can throw an error
    func spinHelloWorld() async throws -> String {
        let query = ChatQuery(model: .gpt3_5Turbo, messages: [.init(role: .user, content: "Give a creative spin on 'Hello, world!'")]) // build a query with a the GPT 3.5 Turbo model, and ask for a response to the prompt: "Give me a creative spin on 'Hello, world!'"

        var result = "" // prepare to accumulate the result
        for try await response in openAI.chatsStream(query: query) {
            // if there is a response, add it to the stream of characters in `result`
            if let r = response.choices.first?.delta.content {
                result += r // add to `result`
            }
        }

        return result // return finished `result`
    }
}
