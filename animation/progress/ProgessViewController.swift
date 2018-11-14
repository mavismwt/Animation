//
//  ProgessViewController.swift
//  animation
//
//  Created by Apple on 2018/10/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ProgessViewController: UIViewController {
    
    var progressView: ProgressView!
    var number: UITextField?
    var addButton: UIButton?
    var minusButton: UIButton?
    var proNumber = 4.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView = ProgressView.init(frame: CGRect(x: 100, y: 200, width: 210, height: 210))
        
        number = UITextField(frame: CGRect(x: 155, y: 600, width: 40, height: 20))
        number?.backgroundColor = UIColor.white
        
        
        addButton = UIButton(frame: CGRect(x: 90, y: 500, width: 60, height: 60))
        addButton?.setTitle("Add", for: UIControlState.normal)
        addButton?.addTarget(self, action: #selector(addProgress), for: UIControlEvents.touchUpInside)
        
        minusButton = UIButton(frame: CGRect(x: 260, y: 500, width: 60, height: 60))
        minusButton?.setTitle("Minus", for: UIControlState.normal)
        minusButton?.addTarget(self, action: #selector(minusProgress), for: UIControlEvents.touchUpInside)
        
        self.view.backgroundColor = UIColor.clear
        self.view.addSubview(progressView)
        self.view.addSubview(number!)
        self.view.addSubview(addButton!)
        self.view.addSubview(minusButton!)
    }
    
    
    //增加进度
    @objc func addProgress(_ sender: AnyObject) {
        progressView?.setProgress(progressView.progress + 25, animated: true)
    }
    
    //减少进度
    @objc func minusProgress(_ sender: AnyObject) {
        progressView?.setProgress(progressView.progress - 25, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
