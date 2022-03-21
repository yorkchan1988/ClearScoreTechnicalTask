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
    
    var viewModel: DashboardViewModel!
    var router: DashboardRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Dashboard"
        navigationItem.backButtonTitle = ""
        
        bindViewModel()
        
        setInitialState()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+InitialDelayToShowCreditScoreView) { [unowned self] in
            showInitialCreditScoreViewAnimation()
        }
    }
    
    // let the user to see the most updated value when this page is shown
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getCreditValues()
    }
    
    // MARK: Private
    private func bindViewModel() {
        viewModel.didDataChange = { [unowned self] data in
            updateCreditScore()
        }
        viewModel.didErrorOccur = { [unowned self] error in
            AlertView.showErrorAlert(error: error, target: self)
        }
    }
    
    private func setInitialState() {
        viewCircularBackground.alpha = 0
        viewTextContainer.alpha = 0
        lblCreditScore.alpha = 0
    }
    
    private func showInitialCreditScoreViewAnimation() {
        
        setInitialState()
        
        let showTextAnimation = { [unowned self] in
            UIView.animate(withDuration: AnimationDurationOfCreditScoreDescription) { [unowned self] in
                viewTextContainer.alpha = 1.0
            } completion: { finished in
            }
        }
        
        UIView.animate(withDuration: AnimationDurationOfCreditScoreBackground) { [unowned self] in
            viewCircularBackground.alpha = CircularBackgroundView.BackgroundAlpha
        } completion: { finished in
            showTextAnimation()
        }
    }
    
    private func updateCreditScore() {
        lblCreditScore.alpha = 0
        
        let creditScore = viewModel.creditValue?.creditReportInfo.score ?? 0
        lblCreditScore.text = String(format: "%ld", creditScore)
        
        let maxCreditScore = viewModel.creditValue?.creditReportInfo.maxScoreValue ?? 0
        lblOutOfTotal.text = String(format: "out of %ld", maxCreditScore)
        
        UIView.animate(withDuration: AnimationDurationOfCreditScoreText) { [unowned self] in
            lblCreditScore.alpha = 1.0
        } completion: { finished in
            
        }
        
        let percentage = CGFloat(creditScore) / CGFloat(maxCreditScore)
        // call the animation with circularViewDuration
        viewCircularProgress.animateProgress(from: 0, to: percentage)
    }
    
    // MARK: IBAction
    @IBAction func didPressCreditScoreView(_ sender: Any) {
        if let creditValue = viewModel.creditValue {
            router.toDetailPage(creditValue: creditValue)
        }
    }
}
