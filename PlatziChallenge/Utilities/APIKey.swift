//
//  APIKey.swift
//  PlatziChallenge
//
//  Created by Miguel Aquino on 20/12/20.
//

import Foundation

/**
 Entity used to represent the `APIKey` to read from the `API-Keys.plist`
 */
struct APIKey: Codable {
    var api_key: String
}
