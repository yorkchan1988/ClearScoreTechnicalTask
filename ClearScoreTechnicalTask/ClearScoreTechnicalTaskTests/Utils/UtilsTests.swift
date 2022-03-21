//
//  UtilsTest.swift
//  ClearScoreIOSTechnicalTaskTests
//
//  Created by YORK CHAN on 12/3/2022.
//

import Foundation

import XCTest

@testable
import ClearScoreTechnicalTask

class UtilsTests: XCTestCase {
    
    func test_getBaseUrlString() throws {
        // GIVEN
        
        // WHEN
        let baseUrlString = getBaseUrlString()
        
        // THEN
        XCTAssertEqual(baseUrlString, "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/")
    }
}
