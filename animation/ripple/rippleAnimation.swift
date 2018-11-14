//
//  rippleAnimation.swift
//  animation
//
//  Created by Apple on 2018/5/31.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class seventhViewController: UIViewController {
    
    var ripple = rippleView.init(frame: UIScreen.main.bounds)
    var layer = CAShapeLayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //ripple.frame =
        self.view.addSubview(ripple)
        self.view.backgroundColor = UIColor.white
        
    }
    //画一个圆
    func bezierDrawCircle() {
        let radius: CGFloat = 110.0
        let startAngle: CGFloat = 0.0
        let endAngle: CGFloat = CGFloat(Double.pi * 2)
        let path = UIBezierPath(arcCenter: CGPoint(x: 190,y: 300), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        let screenLayer = CAShapeLayer()
        screenLayer.bounds = UIScreen.main.bounds
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.borderColor = UIColor.white.cgColor
        layer.strokeColor = UIColor.init(red: 69/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.5).cgColor
        self.view.layer.addSublayer(screenLayer)
        self.view.layer.addSublayer(layer)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

