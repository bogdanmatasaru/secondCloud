//
//  Environment.swift
//  testXCloud
//
//  Created by Bogdan on 08.06.2023.
//

import Foundation

public var environmentConfig: Environment = {
    return parseConfig()
}()

public struct Environment: Decodable {
    public let xcodeCloudBuild: Bool
    public let backendSettingsEnabled: Bool
    
    private enum CodingKeys: String, CodingKey {
        case xcodeCloudBuild
        case backendSettingsEnabled
    }
}

func parseConfig() -> Environment {
    let url = Bundle.main.url(forResource: "Environment", withExtension: "plist")!
    let data = try! Data(contentsOf: url)
    let decoder = PropertyListDecoder()
    return try! decoder.decode(Environment.self, from: data)
}
