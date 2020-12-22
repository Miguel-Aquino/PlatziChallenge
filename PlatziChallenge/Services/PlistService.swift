//
//  PlistService.swift
//  PlatziChallenge
//
//  Created by Miguel Aquino on 20/12/20.
//

import Foundation

class PlistService {
    /**
     Function used to read the key from the `API-keys.plist`
     */
    static func getPlistKey(key: PlistKey) -> String {
        guard let path = Bundle.main.path(forResource: "API-keys", ofType: "plist"),
              let xml = FileManager.default.contents(atPath: path)
        else { return "" }
        
        switch key {
        case .apiKey:
            guard let apiKey = try? PropertyListDecoder().decode(APIKey.self, from: xml) else { return "" }
            return apiKey.api_key
        }
    }
}

enum PlistKey {
    case apiKey
}
