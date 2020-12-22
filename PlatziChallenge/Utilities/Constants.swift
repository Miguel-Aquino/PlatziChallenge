//
//  Constants.swift
//  PlatziChallenge
//
//  Created by Miguel Aquino on 20/12/20.
//

import UIKit

enum ApiURL {
    static let catsURL = "https://api.thecatapi.com/v1/breeds"
    static let catImageURL = "https://cdn2.thecatapi.com/images/"
}

enum Keys {
    static let API_KEY = "api_key"
}

enum Images {
    static let cat = UIImage(named: "cat.png")
    static let emptyCat = UIImage(named: "cat_empty")
    static let noCatImage = UIImage(named: "no_cat_image")
    static let childFriendly = UIImage(named: "heart")
    static let origin = UIImage(named: "origin")
    static let energy = UIImage(named: "energy")
    static let adaptability = UIImage(named: "adapt")
    static let intelligence = UIImage(named: "lightbulb")
    static let dogFriendly = UIImage(named: "paw")
    static let back = UIImageView(image: UIImage(named: "back_white"))
}

enum Identifiers {
    static let appTitle = "My Cat App"
    static let catsHeader = "CatsHeader"
    static let catCell = "CatCell"
    static let catDetailCell = "CatDetailCell"
}

enum VCs {
    static let catDetailsVC = CatDetailsViewController()
}

enum TraitType {
    case childFriendly
    case origin
    case dogFriendly
    case intelligence
    case energyLevel
    case adaptability
    
    var value : String {
        switch self {
        case .childFriendly:
            return "Child Friendly"
        case .origin:
            return "Origin"
        case .dogFriendly:
            return "Dog Friendly"
        case .intelligence:
            return "Intelligence"
        case .energyLevel:
            return "Energy Level"
        case .adaptability:
            return "Adapatability"
        }
    }
}

enum TraitColor {
    case childFriendly
    case origin
    case dogFriendly
    case intelligence
    case energyLevel
    case adaptability
    
    var value : UIColor {
        switch self {
        case .childFriendly:
            return .lightRed
        case .origin:
            return .lightTeal
        case .dogFriendly:
            return .lightPurple
        case .intelligence:
            return .lightOrange
        case .energyLevel:
            return .lightBlue
        case .adaptability:
            return .lightGreen
        }
    }
}
