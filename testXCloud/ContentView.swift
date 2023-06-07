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
            Text(Secrets.releaseBuild)
        }
        .padding()
    }
    
}

struct Secrets {
    private static func secrets() -> [String: Any] {
        let fileName = "env"
        let path = Bundle.main.path(forResource: fileName, ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        return try! JSONSerialization.jsonObject(with: data) as! [String: Any]
    }

    static var releaseBuild: String {
        return secrets()["RELEASE_BUILD"] as! String
    }
    
    static var app: String {
        return "sss"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
