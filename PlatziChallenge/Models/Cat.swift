//
//  Cat.swift
//  PlatziChallenge
//
//  Created by Miguel Aquino on 20/12/20.
//

import Foundation

/**
 Entity used to represent the data of a `Cat`
*/
struct Cat: Codable, Hashable {
    let id: String?
    let name: String
    let origin: String
    let description: String
    let reference_image_id: String?
    
    let child_friendly: Int
    let dog_friendly: Int
    let stranger_friendly: Int
    let intelligence: Int
    let adaptability: Int
    let energy_level: Int
}
