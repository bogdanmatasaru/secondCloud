//
//  ContentView.swift
//  testXCloud
//
//  Created by Bogdan on 26.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text(setEnvironmentVars())
        }
        .padding()
    }
    
    private func setEnvironmentVars() -> String {
        if let releaseBuild = ProcessInfo.processInfo.environment["RELEASE_BUILD"] {
            return releaseBuild
        } else {
            #if DEBUG
                return "Debug"
            #elseif FABRIC
                return "Debug"
            #else
                return "Debug"
            #endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
