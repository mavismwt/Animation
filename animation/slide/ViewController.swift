//
//  ViewController.swift
//  animation
//
//  Created by Apple on 2018/5/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView = UIScrollView()
    let sliderLabel = UILabel()
    var num = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstButton = UIButton()
        let secondButton = UIButton()
        let firstView = firstViewController().view
        let secondView = secondViewController().view
        
        firstButton.frame = CGRect(x: self.view.bounds.width/CGFloat(num*2), y: 10, width: self.view.bounds.width/CGFloat(num*2), height: 50)
        firstButton.setTitleColor(UIColor.black, for: UIControlState())
        firstButton.setTitle("firstView", for: UIControlState())
        firstButton.addTarget(self, action: #selector(jumpToFirst), for: UIControlEvents.touchUpInside)
        secondButton.frame = CGRect(x: self.view.bounds.width/CGFloat(num), y: 10, width: self.view.bounds.width/CGFloat(num*2), height: 50)
        secondButton.setTitle("secondView", for: UIControlState())
        secondButton.setTitleColor(UIColor.black, for: UIControlState())
        secondButton.addTarget(self, action: #selector(jumpToSecond), for: UIControlEvents.touchUpInside)
       
        sliderLabel.frame = CGRect(x: self.view.bounds.width/CGFloat(num*2), y: 55, width: self.view.bounds.width/CGFloat(num*2), height: 5)
        sliderLabel.backgroundColor = UIColor.red
        
        scrollView.delegate = self
        scrollView.frame = CGRect(x: 0, y: 60, width: self.view.bounds.width, height: self.view.bounds.height - 60)
        scrollView.contentSize = CGSize(width: self.view.bounds.width * 2, height: self.view.bounds.height - 60)
        scrollView.addSubview(firstView!)
        scrollView.addSubview(secondView!)
        scrollView.isPagingEnabled = true //设置只能翻过整页
        
        self.view.addSubview(firstButton)
        self.view.addSubview(secondButton)
        self.view.addSubview(sliderLabel)
        self.view.addSubview(scrollView)
    }
    @objc func jumpToFirst(){
        UIView.animate(withDuration: 0.4) {
            self.sliderLabel.transform = CGAffineTransform(translationX: 0, y: 0)
            self.scrollView.contentOffset = CGPoint(x: 0, y: 0)
        }
        UIView.animate(withDuration: 0.4){
            self.sliderLabel.transform = CGAffineTransform.init(scaleX: 2, y: 1)
        }
    }
    @objc func jumpToSecond(){
        UIView.animate(withDuration: 0.4) {
            self.sliderLabel.transform = CGAffineTransform(translationX: self.view.bounds.width/CGFloat(self.num*2), y: 0)
            self.scrollView.contentOffset = CGPoint(x: self.view.bounds.width, y: 0)
        }
    }
    
    /*func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let x = scrollView.contentOffset.x
        if x <= self.view.bounds.width/CGFloat(2) {
            UIView.animate(withDuration: 0.4) {
                self.sliderLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                self.scrollView.contentOffset = CGPoint(x: 0, y: 0)
            }
        }else {
            UIView.animate(withDuration: 0.4) {
                self.sliderLabel.transform = CGAffineTransform(translationX: self.view.bounds.width/CGFloat(self.num*2), y: 0)
                self.scrollView.contentOffset = CGPoint(x: self.view.bounds.width, y: 0)
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        if x <= self.view.bounds.width/CGFloat(2) {
            UIView.animate(withDuration: 0.4) {
                self.sliderLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                self.scrollView.contentOffset = CGPoint(x: 0, y: 0)
            }
        }else {
            UIView.animate(withDuration: 0.4) {
                self.sliderLabel.transform = CGAffineTransform(translationX: self.view.bounds.width/CGFloat(self.num*2), y: 0)
                self.scrollView.contentOffset = CGPoint(x: self.view.bounds.width, y: 0)
            }
        }
    }*/
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let slideX = scrollView.contentOffset.x/CGFloat(4)
        print("x:\(scrollView.contentOffset.x) y:\(scrollView.contentOffset.y)")
        sliderLabel.transform = CGAffineTransform(translationX: slideX, y: 0)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

