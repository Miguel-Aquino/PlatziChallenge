//
//  CatViewModel.swift
//  PlatziChallenge
//
//  Created by Miguel Aquino on 21/12/20.
//

import UIKit

struct CatViewModel {
    private var cat: Cat

    init(_ cat: Cat) {
        self.cat = cat
    }
    
    var id: String {
        guard let id = cat.id else { return "" }
        return id
    }
    
    var name: String {
        return cat.name
    }
    
    var origin: String {
        return cat.origin
    }
    
    var description: String {
        return cat.description
    }
    
    var reference_image_id: String {
        guard let reference_image_id = cat.reference_image_id else { return "" }
        return reference_image_id
    }
    
    var child_friendly: Int {
        return cat.child_friendly
    }
    
    var dog_friendly: Int {
        return cat.dog_friendly
    }
    
    var stranger_friendly: Int {
        return cat.stranger_friendly
    }
    
    var intelligence: Int {
        return cat.intelligence
    }
    
    var adaptability: Int {
        return cat.adaptability
    }
    
    var energy_level: Int {
        return cat.energy_level
    }
    
    var catImageURL: String {
        guard let imageId = cat.reference_image_id else { return "" }
        return ApiURL.catImageURL + "\(imageId).jpg"
    }
    
    func getCatTraits() -> [CatTraitsViewModel] {
        var catTraitsViewModel = [CatTraitsViewModel]()
        
        if let originImage = Images.origin {
        let item = CatTraitsViewModel(CatTraits(score: "\(cat.origin)",
                                                color: TraitColor.origin,
                                                type: TraitType.origin,
                                                image: originImage))
            catTraitsViewModel.append(item)
            
        }
        
        if let child_friendly = Images.childFriendly {
            let item = CatTraitsViewModel(CatTraits(score: "\(cat.child_friendly)",
                                                color: TraitColor.childFriendly,
                                                type: TraitType.childFriendly,
                                                image: child_friendly))
            catTraitsViewModel.append(item)
        }
        
        if let dogFriendly = Images.dogFriendly {
            let item = CatTraitsViewModel(CatTraits(score: "\(cat.dog_friendly)",
                                                color: TraitColor.dogFriendly,
                                                type: TraitType.dogFriendly,
                                                image: dogFriendly))
            catTraitsViewModel.append(item)
        }
        
        if let intelligence = Images.intelligence {
            let item = CatTraitsViewModel(CatTraits(score: "\(cat.intelligence)",
                                                color: TraitColor.intelligence,
                                                type: TraitType.intelligence,
                                                image: intelligence))
            catTraitsViewModel.append(item)
        }
        
        if let adaptability = Images.adaptability {
            let item = CatTraitsViewModel(CatTraits(score: "\(cat.adaptability)",
                                                color: TraitColor.adaptability,
                                                type: TraitType.adaptability,
                                                image: adaptability))
            catTraitsViewModel.append(item)
        }
        
        if let energyLevel = Images.energy {
            let item = CatTraitsViewModel(CatTraits(score: "\(cat.energy_level)",
                                                color: TraitColor.energyLevel,
                                                type: TraitType.energyLevel,
                                                image: energyLevel))
            catTraitsViewModel.append(item)
        }
        
        return catTraitsViewModel
    }
}

