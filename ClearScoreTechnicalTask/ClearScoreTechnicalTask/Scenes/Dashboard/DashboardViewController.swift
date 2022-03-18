//
//  DashboardViewController.swift
//  ClearScoreTechnicalTask
//
//  Created by YORK CHAN on 18/3/2022.
//

import Foundation
import UIKit

class DashboardViewController: UIViewController {
    
    private let InitialDelayToShowCreditScoreView = 0.7
    private let AnimationDurationOfCreditScoreBackground = 0.2
    private let AnimationDurationOfCreditScoreDescription = 0.2
    private let AnimationDurationOfCreditScoreText = 0.3
    
    @IBOutlet weak var viewCircularBackground: CircularBackgroundView!
    @IBOutlet weak var viewCircularProgress: CircularProgressBarView!
    @IBOutlet weak var viewTextContainer: UIView!
    @IBOutlet weak var lblCreditScore: UILabel!
    @IBOutlet weak var lblOutOfTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Dashboard"
        
        setInitialState()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+InitialDelayToShowCreditScoreView) { [unowned self] in
            showCreditScoreViewAnimation()
        }
    }
    
    func setInitialState() {
        viewCircularBackground.alpha = 0
        viewTextContainer.alpha = 0
        lblCreditScore.alpha = 0
    }
    
    func showCreditScoreViewAnimation() {
        
        setInitialState()
        
        let showCreditScoreAnimation = { [unowned self] in
            UIView.animate(withDuration: AnimationDurationOfCreditScoreText) { [unowned self] in
                lblCreditScore.alpha = 1.0
            } completion: { finished in
                
            }
        }
        
        let showTextAnimation = { [unowned self] in
            UIView.animate(withDuration: AnimationDurationOfCreditScoreDescription) { [unowned self] in
                viewTextContainer.alpha = 1.0
            } completion: { [unowned self] finished in
                showCreditScoreAnimation()
                // call the animation with circularViewDuration
                viewCircularProgress.animateProgress(from: 0, to: 0.8)
            }
        }
        
        UIView.animate(withDuration: AnimationDurationOfCreditScoreBackground) { [unowned self] in
            viewCircularBackground.alpha = CircularBackgroundView.BackgroundAlpha
        } completion: { finished in
            showTextAnimation()
        }
    }
}
