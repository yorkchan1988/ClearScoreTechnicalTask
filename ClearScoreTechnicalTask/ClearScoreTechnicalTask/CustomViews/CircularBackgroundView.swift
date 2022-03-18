//
//  CircularBackgroundView.swift
//  ClearScoreTechnicalTask
//
//  Created by YORK CHAN on 18/3/2022.
//

import Foundation
import UIKit

class CircularBackgroundView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .black
        alpha = 0.3
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = bounds.size.width/2
        layer.masksToBounds = true
    }
}
