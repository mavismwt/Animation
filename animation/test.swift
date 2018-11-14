//
//  try.swift
//  animation
//
//  Created by Apple on 2018/5/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class testViewController: UIViewController {
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let testButton = UIButton(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
        testButton.addTarget(self, action: #selector(tapped), for: UIControlEvents.touchUpInside)
        testButton.backgroundColor = UIColor.black
        UIView.animate(withDuration: 10) {
            testButton.frame.origin = CGPoint(x: 200, y: 10)
        }
        self.view.addSubview(testButton)
    }
    @objc func tapped(){
        print("tapped")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
