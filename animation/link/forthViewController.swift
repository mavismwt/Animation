//
//  forthViewController.swift
//  animation
//
//  Created by Apple on 2018/5/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class forthViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        var cell:CustomizeUITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomizeUITableViewCell
        if (cell == nil)
        {
            cell = CustomizeUITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            cell?.titleinRow.text = "title"
        }
        self.viewDidDisappear(true)
        return cell!
    }
    
    
    var bannerView = UITableView()
    var contentView = UITableView()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        bannerView.delegate = self
        bannerView.dataSource = self
        contentView.delegate = self
        contentView.dataSource = self
        
        bannerView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width/CGFloat(3), height: self.view.bounds.height)
        bannerView.contentSize = CGSize(width: self.view.bounds.width/CGFloat(3), height: self.view.bounds.height*2)
        bannerView.backgroundColor = UIColor.white
        
        contentView.frame = CGRect(x: self.view.bounds.width/CGFloat(3), y: 0, width: self.view.bounds.width/CGFloat(3)*2, height: self.view.bounds.height)
        contentView.contentSize = CGSize(width: self.view.bounds.width/CGFloat(3)*2, height: self.view.bounds.height*2)
        contentView.backgroundColor = UIColor.white
        
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
