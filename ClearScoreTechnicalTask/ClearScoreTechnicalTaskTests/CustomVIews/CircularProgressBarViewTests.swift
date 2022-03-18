//
//  CircularProgressBarViewTests.swift
//  ClearScoreTechnicalTaskTests
//
//  Created by YORK CHAN on 18/3/2022.
//

import XCTest
@testable import ClearScoreTechnicalTask

class CircularProgressBarViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_transformFromToToPi_from_0_to_1() throws {
        // GIVEN
        let from: CGFloat = 0
        let to: CGFloat = 1
        let circularProgressView = CircularProgressBarView()
        
        // WHEN
        let startPoint = circularProgressView.transformPercentageToPi(percentage: from)
        let endPoint = circularProgressView.transformPercentageToPi(percentage: to)
        
        // THEN
        XCTAssertEqual(startPoint, CGFloat(-Double.pi / 2))
        XCTAssertEqual(endPoint, CGFloat(3 * Double.pi / 2))
    }
    
    func test_transformFromToToPi_from_0_to_0_25() throws {
        // GIVEN
        let from: CGFloat = 0
        let to: CGFloat = 0.25
        let circularProgressView = CircularProgressBarView()
        
        // WHEN
        let startPoint = circularProgressView.transformPercentageToPi(percentage: from)
        let endPoint = circularProgressView.transformPercentageToPi(percentage: to)
        
        // THEN
        XCTAssertEqual(startPoint, CGFloat(-Double.pi / 2))
        XCTAssertEqual(endPoint, 0)
    }
    
    func test_transformFromToToPi_from_0_to_0_5() throws {
        // GIVEN
        let from: CGFloat = 0
        let to: CGFloat = 0.5
        let circularProgressView = CircularProgressBarView()
        
        // WHEN
        let startPoint = circularProgressView.transformPercentageToPi(percentage: from)
        let endPoint = circularProgressView.transformPercentageToPi(percentage: to)
        
        // THEN
        XCTAssertEqual(startPoint, CGFloat(-Double.pi / 2))
        XCTAssertEqual(endPoint, CGFloat(1 * Double.pi / 2))
    }
    
    func test_transformFromToToPi_from_0_to_0_75() throws {
        // GIVEN
        let from: CGFloat = 0
        let to: CGFloat = 0.75
        let circularProgressView = CircularProgressBarView()
        
        // WHEN
        let startPoint = circularProgressView.transformPercentageToPi(percentage: from)
        let endPoint = circularProgressView.transformPercentageToPi(percentage: to)
        
        // THEN
        XCTAssertEqual(startPoint, CGFloat(-Double.pi / 2))
        XCTAssertEqual(endPoint, CGFloat(Double.pi))
    }
}
