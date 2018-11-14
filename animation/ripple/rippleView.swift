//
//  rippleView.swift
//  animation
//
//  Created by Apple on 2018/5/31.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class rippleView: UIView {
    
    var displayLink = CADisplayLink()
    var mainRippleLayer = CAShapeLayer()
    var minorRippleLayer = CAShapeLayer()
    var rippleA: CGFloat = 0
    var rippleW: CGFloat = 0
    var offsetX: CGFloat = 0
    var b : CGFloat = 0
    var rippleSpeed : CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initData()
        configUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initData() {
        rippleSpeed = 0.05
        rippleA = 8
        rippleW = 2 * CGFloat(Double.pi) / bounds.size.width
        b  = bounds.size.height / 2
    }
    private func configUI(){
        mainRippleLayer.fillColor = UIColor.init(red: 69/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.5).cgColor
        minorRippleLayer.fillColor = UIColor.init(red: 69/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.5).cgColor
        layer.addSublayer(mainRippleLayer)
        layer.addSublayer(minorRippleLayer)
        displayLink = CADisplayLink(target: self, selector: #selector(getCurrentWave))
        displayLink.add(to: RunLoop.current, forMode: .commonModes)
    }
    @objc private func getCurrentWave() {
        offsetX += rippleSpeed
        setCurrentStatusWavePath()
    }
    private func setCurrentStatusWavePath() {
        // 创建一个路径
        let firstPath = CGMutablePath()
        var firstY = bounds.size.width/2
        firstPath.move(to: CGPoint(x: 0, y: firstY))
        for i in 0...Int(bounds.size.width) {
            firstY = rippleA * sin(rippleW * CGFloat(i) + offsetX) + b
            firstPath.addLine(to: CGPoint(x: CGFloat(i), y: firstY))
        }
        
        firstPath.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height))
        firstPath.addLine(to: CGPoint(x: 0, y: bounds.size.height))
        firstPath.closeSubpath()
        mainRippleLayer.path = firstPath
        //第二条路径
        let secondPath = CGMutablePath()
        var secondY = bounds.size.width/2
        secondPath.move(to: CGPoint(x: 0, y: secondY))
        
        for i in 0...Int(bounds.size.width) {
            secondY = rippleA * sin(rippleW * CGFloat(i) + offsetX - bounds.size.width/2 ) + b
            secondPath.addLine(to: CGPoint(x: CGFloat(i), y: secondY))
        }
        secondPath.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height))
        secondPath.addLine(to: CGPoint(x: 0, y: bounds.size.height))
        secondPath.closeSubpath()
        minorRippleLayer.path = secondPath
    }
    //释放CADisplayLink
    deinit {
        displayLink.invalidate()
    }
    
    
}
