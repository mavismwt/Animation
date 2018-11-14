//
//  test.swift
//  animation
//
//  Created by Apple on 2018/5/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class testView: UIViewController {
    
    var imgView = UIImageView()
    var lineStartPoint = CGPoint()
    var lineEndPoint = CGPoint()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        imgView.frame = CGRect(x: 60, y: 120, width: self.view.bounds.size.width - 120, height: 240)
        
        self.view.backgroundColor = UIColor.black
        
        self.view.addSubview(imgView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touchPoint = CGPoint()
        var touchAction = UITouch()
        /*if touchAction.isAccessibilityElement {
         touchPoint = touchAction.location(in: textView)
         self.lineStartPoint = touchPoint
         }*/
        touchPoint = touchAction.location(in: imgView)
        print("\(touchPoint)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

