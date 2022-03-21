//
//  CreditValuesRepositoryTests.swift
//  ClearScoreTechnicalTaskTests
//
//  Created by YORK CHAN on 19/3/2022.
//

import Foundation

import XCTest

@testable
import ClearScoreTechnicalTask

class CreditValuesRepositoryTests: XCTestCase {
    
    func test_getCreditValues_success() throws {
        // GIVEN
        let networkManager = FakeNetworkManager()
        let repository = CreditValuesRepository(networkManager: networkManager, queueManager: QueueManager.shared)
        
        // WHEN
        let expectation = expectation(description: "Test Get Credit Value API")
        repository.getCreditValues { result in
            // THEN
            
            switch result {
            case .success(let data):
                XCTAssertEqual(data.creditReportInfo.score, 514)
                XCTAssertEqual(data.creditReportInfo.maxScoreValue, 700)
                XCTAssertEqual(data.creditReportInfo.clientRef, "CS-SED-655426-708782")
                XCTAssertEqual(data.creditReportInfo.currentShortTermDebt, 13758)
                XCTAssertEqual(data.creditReportInfo.currentShortTermCreditLimit, 30600)
                XCTAssertEqual(data.creditReportInfo.currentLongTermDebt, 24682)
                XCTAssertNil(data.creditReportInfo.currentLongTermCreditLimit)
                XCTAssertEqual(data.creditReportInfo.equifaxScoreBand, 4)
                XCTAssertEqual(data.creditReportInfo.equifaxScoreBandDescription, "Excellent")
                break
            case .failure(let error):
                XCTAssertNil(error)
                break
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
    }
}
