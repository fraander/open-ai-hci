//
//  ContentView.swift
//  open-ai-ios
//
//  Created by Frank Anderson on 1/27/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var openAIService: OpenAIService // retrieve the API service from the environment
    @State var helloWorld = ""
    
    var body: some View {
        VStack(spacing: 24) {
            
            Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.white)
            Text(helloWorld)
                .multilineTextAlignment(.center)
                .font(.system(.title3, design: .monospaced, weight: .bold))
                .foregroundStyle(.white)
            
            Spacer()
            
            Button("Reload", systemImage: "arrow.counterclockwise") {
                Task {
                    await reload()
                }
            }
            .buttonStyle(.bordered)
            .tint(.white)
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background {
            LinearGradient(gradient: Gradient(colors: [.mint, .teal, .indigo]), startPoint: .top, endPoint: .bottom)
        }
        .ignoresSafeArea(.all)
        .task { await reload() }
    }
    
    func reload() async {
        if let value = try? await openAIService.spinHelloWorld() {
            helloWorld = value
        }
    }
}

#Preview {

    @StateObject var openAIService: OpenAIService = .init() // create the API Service wrapper to handle results

    return ContentView().environmentObject(openAIService)
}
