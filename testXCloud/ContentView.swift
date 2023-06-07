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
            List {
                ForEach(getEnv(), id: \.self) { section in
                    Text(section)
                }
            }
        }
        .padding()
    }
    
    private func setEnvironmentVars() -> String {
        if let releaseBuild = ProcessInfo.processInfo.environment["RELEASE_BUILD"] {
            return releaseBuild
        } else {
            #if DEBUG
                return "fallback debug"
            #elseif FABRIC
                return "fallback Debug fabric"
            #else
                return "fallback Debug default"
            #endif
        }
    }
    
    func getEnv() -> [String] {
        var envVAR = [String]()
        for (key, value) in ProcessInfo.processInfo.environment {
            print("\(key): \(value)")
            envVAR.append(key)
        }
        return envVAR
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
