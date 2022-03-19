//
//  DashboardViewModel.swift
//  ClearScoreTechnicalTask
//
//  Created by YORK CHAN on 19/3/2022.
//

import Foundation

class DashboardViewModel: ViewModel {
    
    let creditValuesRepository: CreditValuesRepository
    
    private(set) var creditValue: CreditValue?
    
    init(creditValuesRepository: CreditValuesRepository) {
        self.creditValuesRepository = creditValuesRepository
    }
    
    convenience override init() {
        self.init(creditValuesRepository: CreditValuesRepository())
    }
    
    func getCreditValues() {
        
        creditValuesRepository.getCreditValues { result in
            switch result {
            case .failure(let error):
                self.didErrorOccur?(error)
                break
            case .success(let data):
                if (self.creditValue != data) {
                    self.creditValue = data
                    self.didDataChange?(data)
                }
                break
            }
        }
    }

}
