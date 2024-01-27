//
//  main.swift
//  open-ai-hci
//
//  Created by Frank Anderson on 1/26/24.
//

import Foundation
import OpenAI

let configuration = OpenAI.Configuration(token: "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") // setup the configuration object with my API key so that I can make calls to the API
let openAI = OpenAI(configuration: configuration) // setup the OpenAI object to handle API usage, using my previously defined configuration

let query = ChatQuery(model: .gpt3_5Turbo, messages: [.init(role: .user, content: "Give a creative spin on 'Hello, world!'")]) // build a query with a the GPT 3.5 Turbo model, and ask for a response to the prompt: "Give me a creative spin on 'Hello, world!'"

var result = "" // prepare to accumulate the result
for try await response in openAI.chatsStream(query: query) {
    if let r = response.choices.first?.delta.content {
        result += r // add to the accumulator `result`
    }
}

print("RESULT: \(result)") // print the final value
