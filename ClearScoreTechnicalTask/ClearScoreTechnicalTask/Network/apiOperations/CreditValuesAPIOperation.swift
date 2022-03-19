//
//  SearchAPIOperation.swift
//  CandySpaceIOSTechnicalTask
//
//  Created by YORK CHAN on 12/3/2022.
//

import Foundation

class CreditValuesAPIOperation: NetworkOperation<CreditValue> {
    private let apiPath: String = "mockcredit/values"
    private let networkManager: NetworkManagerProtocol
    
    // by default, assign network manager singleton
    // to increase the flexibility of writing unit test, I tend to inject the dependency into the constructor
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    convenience override init() {
        self.init(networkManager: NetworkManager.shared)
    }
       
    override func main() {
        
        networkManager.requestData(apiPath: apiPath, httpMethod: .get, parameters: [:]) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.complete(result: .failure(error))
                break
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(CreditValue.self, from: data)
                    self?.complete(result: .success(result))
                }
                catch {
                    self?.complete(result: .failure(NetworkError.responseError))
                }
                break
            }
        }
    }
}
