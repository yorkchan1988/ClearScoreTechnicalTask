//
//  DashboardRouter.swift
//  ClearScoreTechnicalTask
//
//  Created by YORK CHAN on 19/3/2022.
//

import Foundation

class DashboardRouter {
    let view: DashboardViewController
    
    init(view: DashboardViewController) {
        self.view = view
    }
    
    func toDetailPage(creditValue: CreditValue) {
        let creditReportView = CreditReportViewController(nibName: "CreditReportViewController", bundle: nil)
        let viewModel = CreditReportViewModel(creditValue: creditValue)
        let router = CreditReportRouter(view: creditReportView)
        creditReportView.viewModel = viewModel
        creditReportView.router = router
        view.navigationController?.pushViewController(creditReportView, animated: true)
    }
}
