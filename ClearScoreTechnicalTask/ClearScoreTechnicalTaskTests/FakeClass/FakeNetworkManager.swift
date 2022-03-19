//
//  FakeNetworkManager.swift
//  ClearScoreTechnicalTaskTests
//
//  Created by YORK CHAN on 19/3/2022.
//

import Foundation
@testable import ClearScoreTechnicalTask

class FakeNetworkManager: NetworkManagerProtocol {
    
    let creditValue = CreditValue(creditReportInfo: CreditReportInfo(score: 514, maxScoreValue: 700, clientRef: "CS-SED-655426-708782", currentShortTermDebt: 13758, currentShortTermCreditLimit: 30600, currentLongTermDebt: 24682, currentLongTermCreditLimit: nil, equifaxScoreBand: 4, equifaxScoreBandDescription: "Excellent"))
    
    func requestData(apiPath: String, httpMethod: HTTPMethod, parameters:[String:String], completionHandler : @escaping (Result<Data, NetworkError>) -> ()) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(creditValue) {
            completionHandler(.success(encoded))
        }
    }
}
