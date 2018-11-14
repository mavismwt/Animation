//
//  rippleDrawing.swift
//  animation
//
//  Created by Apple on 2018/5/31.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class eigthViewController: UIViewController {
    
    var displayLink = CADisplayLink()
    var waveLayer = CAShapeLayer()
    var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //self.bezierDrawCircle()
        //self.bezierDrawCurves()
        self.view.backgroundColor = UIColor.white
        
    }
    //画一条曲线
    func bezierDrawCurves() {
        
        let startPoint = CGPoint(x: 80,y: 300)
        let endPoint = CGPoint(x: 300,y: 300)
        let controlPoint = CGPoint(x: 150,y: 250)
        let controlPoint2 = CGPoint(x: 220,y: 350)
        
        let  layer1 = CALayer()
        layer1.frame = CGRect(x: startPoint.x, y: startPoint.y, width: 10, height: 10)
        layer1.backgroundColor = UIColor.red.cgColor
        
        let  layer2 = CALayer()
        layer2.frame = CGRect(x: endPoint.x, y: endPoint.y, width: 10, height: 10)
        layer2.backgroundColor = UIColor.red.cgColor
        
        let  layer3 = CALayer()
        layer3.frame = CGRect(x: controlPoint.x, y: controlPoint.y, width: 10, height: 10)
        layer3.backgroundColor = UIColor.red.cgColor
        
        let path = UIBezierPath()
        let layer = CAShapeLayer()
        
        path.move(to: startPoint)
        path.addCurve(to: endPoint, controlPoint1: controlPoint, controlPoint2: controlPoint2)
        
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.blue.cgColor
        
        view.layer.addSublayer(layer)
        view.layer.addSublayer(layer1)
        view.layer.addSublayer(layer2)
        view.layer.addSublayer(layer3)
    }
    //画一个圆
    func bezierDrawCircle() {
        let radius: CGFloat = 110.0
        let startAngle: CGFloat = 0.0
        let endAngle: CGFloat = CGFloat(Double.pi * 2)
        let path = UIBezierPath(arcCenter: CGPoint(x: 190,y: 300), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.blue.cgColor
        view.layer.addSublayer(layer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
