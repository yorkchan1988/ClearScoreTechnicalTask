//
//  DashboardViewController.swift
//  ClearScoreTechnicalTask
//
//  Created by YORK CHAN on 18/3/2022.
//

import Foundation
import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var circularProgressBarView: CircularProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Dashboard"
        
        setUpCircularProgressBarView()
    }
    
    func setUpCircularProgressBarView() {
        // call the animation with circularViewDuration
        circularProgressBarView.animateProgress(from: 0, to: 0.8)
    }
}
