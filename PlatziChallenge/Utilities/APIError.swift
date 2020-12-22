//
//  APIError.swift
//  PlatziChallenge
//
//  Created by Miguel Aquino on 20/12/20.
//

import Foundation

/**
 Enum used to represent errors from the API
 */
enum APIError: Error {
    case unknownError
    case invalidResponse
    case invalidData
    
    var localizedDescription : String{
        switch self {
        case .unknownError:
            return "Unknown error occurred"
        case .invalidResponse:
            return "Invalid response from the server"
        case .invalidData:
            return "Invalid data received from the server"
        }
    }
}
