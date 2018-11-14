//
//  line.swift
//  animation
//
//  Created by Apple on 2018/5/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class lineViewController: UIViewController {
    
    
    var path = CGMutablePath()
    var lineStartPoint = CGPoint()
    var lineEndPoint = CGPoint()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var imgView = DrawingBoardView.init(frame: CGRect(x: 60, y: 120, width: self.view.bounds.size.width - 120, height: 240))
        imgView.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(imgView)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
