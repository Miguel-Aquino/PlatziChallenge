//
//  CatTraitsViewModel.swift
//  PlatziChallenge
//
//  Created by Miguel Aquino on 21/12/20.
//

import UIKit

struct CatTraitsViewModel {
    private var catTraits: CatTraits
    
    init(_ catTraits: CatTraits) {
        self.catTraits = catTraits
    }
    
    var score: String {
        return catTraits.score
    }
    
    var color: TraitColor {
        return catTraits.color
    }
    
    var type: TraitType {
        return catTraits.type
    }
    
    var image: UIImage {
        return catTraits.image
    }
}
