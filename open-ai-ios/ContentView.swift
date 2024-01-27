//
//  ContentView.swift
//  open-ai-ios
//
//  Created by Frank Anderson on 1/27/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var openAIService: OpenAIService // retrieve the API service from the environment
    @State var helloWorld = "" // hold onto the text to display, use @State since it will change and you want the view to update to reflect this
    
    var body: some View {
        VStack(spacing: 24) { // display content in this container stacked vertically
            
            Spacer() // push content down
            
            Image(systemName: "globe") // Show a Globe using built-in SF Symbols
                .imageScale(.large) // make it larger
                .foregroundStyle(.white) // make it white
            
            Text(helloWorld)
                .multilineTextAlignment(.center) // center the text
                .font(.system(.title3, design: .monospaced, weight: .bold)) // set the font to monospaced, bold, and slightly larger than standard
                .foregroundStyle(.white) // make the text white
            
            Spacer() // push content up and down
            
            Button("Reload", systemImage: "arrow.counterclockwise") { // Reload Button
                Task { // create an asynchronous processes
                    await reload() // run the reload function
                }
            }
            .buttonStyle(.bordered) // style the button using a built-in style
            .tint(.white)
        }
        .padding(24) // add 24 pts of space around each edge
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center) // expand to fill teh container
        .background { // make a gradient background going mint -> teal -> indigo
            LinearGradient(gradient: Gradient(colors: [.mint, .teal, .indigo]), startPoint: .top, endPoint: .bottom)
        }
        .ignoresSafeArea(.all) // fit the whole screen
        .task { await reload() } // on first load, run reload function
    }
    
    
    func reload() async { // reload function is asynchronous and doesn't return any value
        // ask the service to create a new version of 'hello, world'.
        if let value = try? await openAIService.spinHelloWorld() {
            // if successful, update the value to display to the new value
            helloWorld = value
        }
    }
}

// support a preview by replicating how this component is normally displayed
#Preview {

    @StateObject var openAIService: OpenAIService = .init() // create the API Service wrapper to handle results

    return ContentView().environmentObject(openAIService) // inject the service into the container
}
