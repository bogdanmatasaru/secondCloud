//
//  ContentView.swift
//  testXCloud
//
//  Created by Bogdan on 26.05.2023.
//

import SwiftUI

struct ContentView: View {
    var envValue: String? {
        let path = Bundle.main.path(forResource: "Environment", ofType: "plist")!
        let url = URL(fileURLWithPath: path)
        let dict = Dictionary<String, AnyObject>.contentsOf(path: url)
        return dict["rb"] as? String
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text(envValue ?? "alora")
        }
        .padding()
    }
    
}

extension Dictionary {
    static func contentsOf(path: URL) -> Dictionary<String, AnyObject> {
        let data = try! Data(contentsOf: path)
        let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)

        return plist as! [String: AnyObject]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
