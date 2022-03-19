//
//  SearchRepository.swift
//  CandySpaceIOSTechnicalTask
//
//  Created by YORK CHAN on 12/3/2022.
//

import Foundation

class CreditValuesRepository {
    
    private let networkManager: NetworkManagerProtocol
    private let queueManager: QueueManager
    
    // by default, assign network manager and queue manager singleton
    // to increase the flexibility of writing unit test, I tend to inject the dependency into the constructor
    init(networkManager: NetworkManagerProtocol, queueManager: QueueManager) {
        self.networkManager = networkManager
        self.queueManager = queueManager
    }
    
    convenience init() {
        self.init(networkManager: NetworkManager.shared, queueManager: QueueManager.shared)
    }
    
    /// Get credit values from the network
    /// - Parameter completionHandler: The completion block
    func getCreditValues(completionHandler: ((_ result: Result<CreditValue, NetworkError>) -> Void)?) {
        
        let operation = CreditValuesAPIOperation()
        operation.completionHandler = completionHandler
        QueueManager.shared.addOperation(operation)
    }
}
