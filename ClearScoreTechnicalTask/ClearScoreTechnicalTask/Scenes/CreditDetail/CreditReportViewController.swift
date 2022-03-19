//
//  CreditDetailViewController.swift
//  ClearScoreTechnicalTask
//
//  Created by YORK CHAN on 19/3/2022.
//

import Foundation
import UIKit

class CreditReportViewController: UIViewController {
    
    var viewModel: CreditReportViewModel!
    var router: CreditReportRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Credit Report"
    }
}
