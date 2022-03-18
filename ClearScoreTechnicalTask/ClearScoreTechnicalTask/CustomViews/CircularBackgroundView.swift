//
//  CircularBackgroundView.swift
//  ClearScoreTechnicalTask
//
//  Created by YORK CHAN on 18/3/2022.
//

import Foundation
import UIKit

class CircularBackgroundView: UIView {
    
    static let BackgroundAlpha = 0.4
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .black
        alpha = CircularBackgroundView.BackgroundAlpha
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = bounds.size.width/2
        layer.masksToBounds = true
    }
}
