//
//  open_ai_iosApp.swift
//  open-ai-ios
//
//  Created by Frank Anderson on 1/27/24.
//

import SwiftUI
import OpenAI

@main
struct open_ai_iosApp: App {
    
    @StateObject var openAIService: OpenAIService = .init() // create the API Service wrapper to handle results
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(openAIService) // add the service to the environment of the view so the view can use it
        }
    }
}
