//
//  PlatziChallengeTests.swift
//  PlatziChallengeTests
//
//  Created by Miguel Aquino on 19/12/20.
//

import XCTest
@testable import PlatziChallenge

class PlatziChallengeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCatViewModel() {
        let cat = Cat(id: "123456",
                      name: "catName",
                      origin: "catOrigin",
                      description: "This is the description",
                      reference_image_id: "987654",
                      child_friendly: 5,
                      dog_friendly: 5,
                      stranger_friendly: 5,
                      intelligence: 5,
                      adaptability: 5,
                      energy_level: 5)
        let catVM = CatViewModel(cat)
        XCTAssertEqual(cat.id, catVM.id)
        
        guard let catImageId = cat.reference_image_id else { return }
        let catImageURL = ApiURL.catImageURL + catImageId + ".jpg"
        XCTAssertEqual(catImageURL, catVM.catImageURL )
    }
    
    func testCatTraitsOrigin() {
        let cat = Cat(id: "123456",
                      name: "catName",
                      origin: "catOrigin",
                      description: "This is the description",
                      reference_image_id: "987654",
                      child_friendly: 5,
                      dog_friendly: 5,
                      stranger_friendly: 5,
                      intelligence: 5,
                      adaptability: 5,
                      energy_level: 5)
        
        guard let origin = Images.origin else { return }
        let catTraits = CatTraits(score: "\(cat.origin)",
                                  color: .origin,
                                  type: .origin,
                                  image: origin)
        
        let catVM = CatViewModel(cat)
        let catTraitsVM = catVM.getCatTraits()
        
        XCTAssertEqual(catTraitsVM[0].image, catTraits.image)
        XCTAssertEqual(catTraitsVM[0].score, catTraits.score)
        XCTAssertEqual(catTraitsVM[0].type, catTraits.type)
        XCTAssertEqual(catTraitsVM[0].color, catTraits.color)
    }
    
    func testCatTraitsChildFriendly() {
        let cat = Cat(id: "123456",
                      name: "catName",
                      origin: "catOrigin",
                      description: "This is the description",
                      reference_image_id: "987654",
                      child_friendly: 5,
                      dog_friendly: 5,
                      stranger_friendly: 5,
                      intelligence: 5,
                      adaptability: 5,
                      energy_level: 5)
        
        guard let image = Images.childFriendly else { return }
        let catTraits = CatTraits(score: "\(cat.child_friendly)",
                                  color: .childFriendly,
                                  type: .childFriendly,
                                  image: image)
        
        let catVM = CatViewModel(cat)
        let catTraitsVM = catVM.getCatTraits()
        
        XCTAssertEqual(catTraitsVM[1].image, catTraits.image)
        XCTAssertEqual(catTraitsVM[1].score, catTraits.score)
        XCTAssertEqual(catTraitsVM[1].type, catTraits.type)
        XCTAssertEqual(catTraitsVM[1].color, catTraits.color)
    }
    
    func testCatTraitsDogFriendly() {
        let cat = Cat(id: "123456",
                      name: "catName",
                      origin: "catOrigin",
                      description: "This is the description",
                      reference_image_id: "987654",
                      child_friendly: 5,
                      dog_friendly: 5,
                      stranger_friendly: 5,
                      intelligence: 5,
                      adaptability: 5,
                      energy_level: 5)
        
        guard let image = Images.dogFriendly else { return }
        let catTraits = CatTraits(score: "\(cat.dog_friendly)",
                                  color: .dogFriendly,
                                  type: .dogFriendly,
                                  image: image)
        
        let catVM = CatViewModel(cat)
        let catTraitsVM = catVM.getCatTraits()
        
        XCTAssertEqual(catTraitsVM[2].image, catTraits.image)
        XCTAssertEqual(catTraitsVM[2].score, catTraits.score)
        XCTAssertEqual(catTraitsVM[2].type, catTraits.type)
        XCTAssertEqual(catTraitsVM[2].color, catTraits.color)
    }
    
    func testCatTraitsIntelligence() {
        let cat = Cat(id: "123456",
                      name: "catName",
                      origin: "catOrigin",
                      description: "This is the description",
                      reference_image_id: "987654",
                      child_friendly: 5,
                      dog_friendly: 5,
                      stranger_friendly: 5,
                      intelligence: 5,
                      adaptability: 5,
                      energy_level: 5)
        
        guard let image = Images.intelligence else { return }
        let catTraits = CatTraits(score: "\(cat.intelligence)",
                                  color: .intelligence,
                                  type: .intelligence,
                                  image: image)
        
        let catVM = CatViewModel(cat)
        let catTraitsVM = catVM.getCatTraits()
        
        XCTAssertEqual(catTraitsVM[3].image, catTraits.image)
        XCTAssertEqual(catTraitsVM[3].score, catTraits.score)
        XCTAssertEqual(catTraitsVM[3].type, catTraits.type)
        XCTAssertEqual(catTraitsVM[3].color, catTraits.color)
    }
    
    func testCatTraitsAdaptability() {
        let cat = Cat(id: "123456",
                      name: "catName",
                      origin: "catOrigin",
                      description: "This is the description",
                      reference_image_id: "987654",
                      child_friendly: 5,
                      dog_friendly: 5,
                      stranger_friendly: 5,
                      intelligence: 5,
                      adaptability: 5,
                      energy_level: 5)
        
        guard let image = Images.adaptability else { return }
        let catTraits = CatTraits(score: "\(cat.adaptability)",
                                  color: .adaptability,
                                  type: .adaptability,
                                  image: image)
        
        let catVM = CatViewModel(cat)
        let catTraitsVM = catVM.getCatTraits()
        
        XCTAssertEqual(catTraitsVM[4].image, catTraits.image)
        XCTAssertEqual(catTraitsVM[4].score, catTraits.score)
        XCTAssertEqual(catTraitsVM[4].type, catTraits.type)
        XCTAssertEqual(catTraitsVM[4].color, catTraits.color)
    }
    
    func testCatTraitsEnergyLevel() {
        let cat = Cat(id: "123456",
                      name: "catName",
                      origin: "catOrigin",
                      description: "This is the description",
                      reference_image_id: "987654",
                      child_friendly: 5,
                      dog_friendly: 5,
                      stranger_friendly: 5,
                      intelligence: 5,
                      adaptability: 5,
                      energy_level: 5)
        
        guard let image = Images.energy else { return }
        let catTraits = CatTraits(score: "\(cat.energy_level)",
                                  color: .energyLevel,
                                  type: .energyLevel,
                                  image: image)
        
        let catVM = CatViewModel(cat)
        let catTraitsVM = catVM.getCatTraits()
        
        XCTAssertEqual(catTraitsVM[5].image, catTraits.image)
        XCTAssertEqual(catTraitsVM[5].score, catTraits.score)
        XCTAssertEqual(catTraitsVM[5].type, catTraits.type)
        XCTAssertEqual(catTraitsVM[5].color, catTraits.color)
    }
}
