//
//  NetworkManagerTests.swift
//  ClearScoreTechnicalTaskTests
//
//  Created by YORK CHAN on 19/3/2022.
//

import Foundation

import XCTest

@testable
import ClearScoreTechnicalTask

class NetworkManagerTests: XCTestCase {
    func test_constructGetUrl() throws {
        // GIVEN
        let parameters = [
            "q":"yellow+flowers",
            "image_type":"photo"
        ]
        var components = URLComponents(string: "https://pixabay.com/api/")!
        
        // WHEN
        NetworkManager.shared.constructGetUrl(parameters: parameters, components: &components)
        
        let url = components.url!
        
        // THEN
        XCTAssert(url.absoluteString.isEqual("https://pixabay.com/api/?q=yellow%2Bflowers&image_type=photo") || url.absoluteString.isEqual("https://pixabay.com/api/?image_type=photo&q=yellow%2Bflowers"))
    }
}
