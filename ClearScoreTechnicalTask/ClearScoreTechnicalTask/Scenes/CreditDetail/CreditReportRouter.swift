//
//  CreditReportRouter.swift
//  ClearScoreTechnicalTask
//
//  Created by YORK CHAN on 19/3/2022.
//

import Foundation

class CreditReportRouter {
    let view: CreditReportViewController
    
    init(view: CreditReportViewController) {
        self.view = view
    }
    
    func back() {
        view.navigationController?.popViewController(animated: true)
    }
}
