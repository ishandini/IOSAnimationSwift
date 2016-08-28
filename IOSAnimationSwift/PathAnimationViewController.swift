//
//  PathAnimationViewController.swift
//  IOSAnimationSwift
//
//  Created by Ishan Weerasooriya on 8/28/16.
//  Copyright © 2016 Ishan Weerasooriya. All rights reserved.
//

import UIKit

class PathAnimationViewController: UIViewController {
	
	@IBOutlet var centerView: UIView!
	let layer = CAShapeLayer()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		drawCanvas1()
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		anim()
	}
	
	func drawCanvas1() {
		
		//// Bezier Drawing
		let path = UIBezierPath(roundedRect: CGRectMake(20, 20, 200, 200), cornerRadius: 40.0)
		layer.path = path.CGPath
		layer.fillColor = UIColor.clearColor().CGColor
		layer.strokeColor = UIColor.blueColor().CGColor
		layer.strokeStart = 0.0
		layer.strokeEnd = 0.0
		layer.lineWidth = 4.0
		layer.lineJoin = kCALineJoinRound
		centerView.layer.addSublayer(layer)
		
	}
	
	func anim() {
		let anim1 = CABasicAnimation(keyPath: "strokeEnd")
		anim1.fromValue = 0.0
		anim1.toValue = 1.0
		anim1.duration = 4.0
		anim1.repeatCount = 0
		anim1.autoreverses = false
		anim1.removedOnCompletion = false
		anim1.additive = true
		anim1.fillMode = kCAFillModeForwards
		self.layer.addAnimation(anim1, forKey: "strokeEnd")
	}
	
}
