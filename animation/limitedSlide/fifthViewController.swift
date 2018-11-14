//
//  fifthViewController.swift
//  animation
//
//  Created by Apple on 2018/5/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class fifthViewController: UIViewController ,UIGestureRecognizerDelegate {
    
    var textView = UITextView()
    var dragGesture = UIPanGestureRecognizer()
    var lineStartPoint = CGPoint()
    var lineEndPoint = CGPoint()
    var imgView = DrawingBoardView.init(frame: CGRect(x: 60, y: 120, width: UIScreen.main.bounds.size.width - 120, height: 240))
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        textView.frame = CGRect(x: 60, y: 120, width: self.view.bounds.width - 120, height: 240)
        textView.text = "我决定在瓦斯炉下面做一个假的老式炬，我拒绝不了老灶的诱惑。小时候读过刘大白的诗，写村妇的脸被灶火映红的动人景象，不知道是不是那首诗作怪，我竟然真的傻里傻气的满台北去找生铁铸的灶门。有人说某个铁工厂有，有人说莺歌有，有人说后车站有，有人说万华有……我不管消息来源可靠不可靠，竟认真的一家一家的去问。我走到双连，那是我小时候住过的地方，走着走着，二三十年的台北在脚下像浪一样的涌动起来。我曾经多爱吃那小小圆圆中间有个小洞的芝麻饼，（咦！现在也不妨再买个来吃呀）我曾在挤得要死的人群里惊看野台戏中的蚌壳精如何在翻搅的海浪中载浮载沉。铁路旁原来是片大泥潭，那些大片的绿叶子已经记不得是芋头叶还是荷叶了，只记得有一次去采叶子几乎要陷下去，愈急愈拔不出脚来。……"
        textView.font = UIFont(name: "ArialMT", size: 20)
        
        /*let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x: 100, y: 100))
        context?.addLine(to: CGPoint(x: 100, y: 200))
        context?.setFillColor(red: 1, green: 0, blue: 1, alpha: 1)
        context?.setLineWidth(3)
        context?.strokePath()*/
        
        dragGesture.delegate = self
        dragGesture.addTarget(self, action: #selector(drag))
        textView.addGestureRecognizer(dragGesture)
        
        imgView.isHidden = true
        
        self.view.backgroundColor = UIColor.black
        
        self.view.addSubview(textView)
        self.view.addSubview(imgView)
    }
    @objc func drag(sender: UIPanGestureRecognizer) {
        var trans:CGPoint = sender.translation(in: textView)
        print("\(trans)")
        if trans.x < 30 && trans.x > -30 {
            //imgView.isHidden = true
            self.view.setNeedsDisplay()
        } else {
            //imgView.isHidden = false
            self.view.setNeedsDisplay()
        }
    }
    //获取初始位置
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        lineStartPoint = gestureRecognizer.location(in: textView)
        print("start:\(lineStartPoint)")
        return true
    }
    /*func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }*/
    //支持多个手势
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
