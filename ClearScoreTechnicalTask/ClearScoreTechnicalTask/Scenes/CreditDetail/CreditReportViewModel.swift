//
//  CreditDetailViewModel.swift
//  ClearScoreTechnicalTask
//
//  Created by YORK CHAN on 19/3/2022.
//

import Foundation

class CreditReportViewModel: ViewModel {
    
    let creditValue: CreditValue
    
    init(creditValue: CreditValue) {
        self.creditValue = creditValue
    }
    
    func getCellTitleByIndex(index: Int) -> String? {
        switch(index) {
        case 0:
            return "Client Ref"
        case 1:
            return "Current Short Term Debt"
        case 2:
            return "Current Short Term Credit Limit"
        case 3:
            return "Current Long Term Debt"
        case 4:
            return "Current Long Term Credit Limit"
        case 5:
            return "Equifax Score Band"
        case 6:
            return "Equifax Score Band Description"
        default:
            return nil
        }
    }
    
    func getCellValueByIndex(index: Int) -> String? {
        switch(index) {
        case 0:
            return self.creditValue.creditReportInfo.clientRef
        case 1:
            return String(format: "%ld", self.creditValue.creditReportInfo.currentShortTermDebt ?? 0)
        case 2:
            return String(format: "%ld", self.creditValue.creditReportInfo.currentShortTermCreditLimit ?? 0)
        case 3:
            return String(format: "%ld", self.creditValue.creditReportInfo.currentLongTermDebt ?? 0)
        case 4:
            return String(format: "%ld", self.creditValue.creditReportInfo.currentLongTermCreditLimit ?? 0)
        case 5:
            return String(format: "%ld", self.creditValue.creditReportInfo.equifaxScoreBand)
        case 6:
            return self.creditValue.creditReportInfo.equifaxScoreBandDescription
        default:
            return nil
        }
    }
}
