//
//  NavigationController.swift
//  ClearScoreTechnicalTask
//
//  Created by YORK CHAN on 19/3/2022.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBarStyle()
        addImageBackground()
    }
    
    private func addImageBackground() {
        let image = UIImage(named: "background")
        let bgImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        bgImageView.image = image
        self.view.insertSubview(bgImageView, at: 0)
        
        let bgAlphaView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        bgAlphaView.backgroundColor = .black
        bgAlphaView.alpha = 0.4
        self.view.insertSubview(bgAlphaView, aboveSubview: bgImageView)
    }
    
    private func setUpNavigationBarStyle() {
        self.navigationBar.isTranslucent = false
        self.navigationBar.tintColor = .white
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
}
