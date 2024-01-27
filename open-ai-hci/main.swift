//
//  main.swift
//  open-ai-hci
//
//  Created by Frank Anderson on 1/26/24.
//

import Foundation
import OpenAI

let configuration = OpenAI.Configuration(token: "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")
let openAI = OpenAI(configuration: configuration)

let query = ChatQuery(model: .gpt3_5Turbo, messages: [.init(role: .user, content: "who are you")])
for try await result in openAI.chatsStream(query: query) {
    result.
}
