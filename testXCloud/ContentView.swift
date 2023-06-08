//
//  ContentView.swift
//  testXCloud
//
//  Created by Bogdan on 26.05.2023.
//

import SwiftUI

struct ContentView: View {
    var backendSettingsStatus: String {
        if environmentConfig.xcodeCloudBuild {
            if environmentConfig.backendSettingsEnabled {
                return "Backend Settings Available"
            } else {
                return "Backend Settings Unavailable"
            }
        } else {
            return "Other environment"
        }
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text(backendSettingsStatus)
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
