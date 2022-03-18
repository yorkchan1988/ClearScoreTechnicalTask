//
//  CircularProgressBarView.swift
//  ClearScoreTechnicalTask
//
//  Created by YORK CHAN on 18/3/2022.
//

import Foundation
import UIKit

class CircularProgressBarView: UIView {
    
    private var progressLayer = CAShapeLayer()
    
    private let circularViewDuration: TimeInterval = 0.6
    private var startPoint: CGFloat = CGFloat.zero
    private var endPoint: CGFloat = CGFloat.zero
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        createCircularPath(startPoint: startPoint, endPoint: endPoint)
        progressAnimation()
    }
    
    private func createCircularPath(startPoint: CGFloat, endPoint: CGFloat) {
        // created circularPath for circleLayer and progressLayer
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: frame.size.width / 2.0, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        // progressLayer path defined to circularPath
        progressLayer.path = circularPath.cgPath
        // ui edits
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 3.5
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.white.cgColor
        // added progressLayer to layer
        layer.addSublayer(progressLayer)
    }
    
    private func progressAnimation() {
        // created circularProgressAnimation with keyPath
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // set the end time
        circularProgressAnimation.duration = circularViewDuration
        circularProgressAnimation.toValue = 1.0
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
    
    // MARK: Public
    /// transform "from" and "to" to pi
    /// 0.0 = -Double.pi / 2
    /// 1.0 = 3 * Double.pi / 2
    func transformPercentageToPi(percentage: CGFloat) -> CGFloat {
        let pi: CGFloat = (2*percentage-0.5) * Double.pi
        return pi
    }
    
    /// remove any existing progress layers, then add progress layer with the new starting point and ending point
    /// - Parameter from: from 0 to 1.0
    /// - Parameter to: from 0 to 1.0
    func animateProgress(from: CGFloat, to: CGFloat) {
        
        guard from >= 0, from <= 1, to >= 0, to <= 1 else {
            return
        }
        
        // remove the progress layer if it's added to the sublayers already
        if let sublayers = layer.sublayers, sublayers.contains(progressLayer) {
            progressLayer.removeFromSuperlayer()
        }
        
        // calculate the start point and end point in pi
        startPoint = transformPercentageToPi(percentage: from)
        endPoint = transformPercentageToPi(percentage: to)
        
        // force the view to redraw
        setNeedsDisplay()
    }
}
