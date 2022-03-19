//
//  CreditDetailViewController.swift
//  ClearScoreTechnicalTask
//
//  Created by YORK CHAN on 19/3/2022.
//

import Foundation
import UIKit

class CreditReportViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: CreditReportViewModel!
    var router: CreditReportRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Credit Report"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
}

extension CreditReportViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let cell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        cell.backgroundColor = .clear
        cell.textLabel?.text = viewModel.getCellTitleByIndex(index: row)
        cell.textLabel?.textColor = .white
        let value = viewModel.getCellValueByIndex(index: row)
        cell.detailTextLabel?.text = value
        cell.detailTextLabel?.textColor = .white
        return cell
    }
}
