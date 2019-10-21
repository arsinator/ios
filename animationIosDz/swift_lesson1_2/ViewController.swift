//
//  ViewController.swift
//  swift_lesson1_2
//
//  Created by 16817252 on 14/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var timer : Timer?
	
	let button : UIButton = {
		let button = UIButton(type: .custom)
		button.setTitle("Назад", for: .normal)
		button.backgroundColor = UIColor.white
		button.setTitleColor(UIColor.black, for: .normal)
		button.addTarget(self, action:  #selector(tapButton), for:.touchDown)
		button.frame = CGRect(x: 25.0, y: 100.0, width: 100.0, height: 40.0)
        button.layer.borderWidth = 3
		return button
	}()
	
	
	let button5 : UIButton = {
		let button = UIButton(type: .custom)
		button.setTitle("CAAnimationGroup", for: .normal)
		button.backgroundColor = UIColor.white
		button.setTitleColor(UIColor.black, for: .normal)
		button.addTarget(self, action:  #selector(tapButton5), for:.touchDown)
		button.frame = CGRect(x: 25.0, y: 300.0, width: 150.0, height: 40.0)
		return button
	}()
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		view.backgroundColor = UIColor.cyan
		view.addSubview(button)
		
		view.addSubview(button5)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		timer?.invalidate()
		timer = nil
	}

	@objc func tapButton () {
		navigationController?.popViewController(animated: true)
	}
	
	
	
	@objc func tapButton5 () {
        
        let corner = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
        corner.autoreverses = true
        corner.duration = 2.0
        corner.fromValue =  button.layer.cornerRadius
        corner.toValue = button.layer.cornerRadius+10
        print(self.button.frame.size.height)
        corner.beginTime = 0
        
        let heightAnimation = CABasicAnimation(keyPath: "bounds.size.height")
        heightAnimation.autoreverses = true
        heightAnimation.duration = 2.0
        heightAnimation.fromValue =  button.layer.bounds.height
        heightAnimation.toValue = button.layer.bounds.height+40
        heightAnimation.beginTime = corner.beginTime+corner.duration
        
        let color = CABasicAnimation(keyPath: "borderColor")
        color.fromValue = UIColor.green.cgColor
        color.toValue = UIColor.blue.cgColor
        color.duration = 2.0
        color.beginTime = heightAnimation.beginTime + heightAnimation.duration
        
		let animation = CAAnimationGroup()

        animation.animations = [corner, heightAnimation,color]

        animation.duration = color.beginTime + color.duration
		button.layer.add(animation, forKey: "ars")
	}
	
}

