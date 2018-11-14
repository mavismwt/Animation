//
//  thirdViewController.swift
//  animation
//
//  Created by Apple on 2018/5/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController,UIScrollViewDelegate {
    var bannerView = UIScrollView()
    var contentView = UIScrollView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        var labelForTest = UILabel()
        var testLabel = UILabel()
        
        bannerView.delegate = self
        contentView.delegate = self
        
        bannerView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width/CGFloat(3), height: self.view.bounds.height)
        bannerView.contentSize = CGSize(width: self.view.bounds.width/CGFloat(3), height: self.view.bounds.height*2)
        bannerView.backgroundColor = UIColor.blue
        labelForTest.text = "test1"
        labelForTest.frame = CGRect(x: 0, y: 200, width: 200, height: 100)
        bannerView.addSubview(labelForTest)
        
        contentView.frame = CGRect(x: self.view.bounds.width/CGFloat(3), y: 0, width: self.view.bounds.width/CGFloat(3)*2, height: self.view.bounds.height)
        contentView.contentSize = CGSize(width: self.view.bounds.width/CGFloat(3)*2, height: self.view.bounds.height*2)
        contentView.backgroundColor = UIColor.gray
        testLabel.text = "test2"
        testLabel.frame = CGRect(x: self.view.bounds.width/CGFloat(3), y: 200, width: 200, height: 100)
        contentView.addSubview(testLabel)
        
        self.view.addSubview(bannerView)
        self.view.addSubview(contentView)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.contentView {
            self.bannerView.delegate = nil
            self.bannerView.setContentOffset(scrollView.contentOffset, animated: false)
            self.bannerView.delegate = self
        } else {
            self.contentView.delegate = nil
            self.contentView.setContentOffset(scrollView.contentOffset, animated: false)
            self.contentView.delegate = self
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
