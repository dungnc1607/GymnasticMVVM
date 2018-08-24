//
//  GIndicatorTabView.swift
//  Gymnastic
//
//  Created by Squall on 8/24/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//
import UIKit
import Foundation

protocol GIndicatorTabViewDelegate {
    func indicatorTab(_ indicatorTab: GIndicatorTabView, _ clickAtTabIndex: Int)
}

class GIndicatorTabView: UIView {
    let indicatorHeight: CGFloat = 3
    let indicatorTag: Int = 1000
    var currentTabIndex: Int = 0
    var indicator: UIView = UIView()
    var delegate: GIndicatorTabViewDelegate?
    var hasTab:Bool = false
    
    
    func createTab(_ items:[String], delegate: GIndicatorTabViewDelegate){
        let widthPerTab: CGFloat = SCREEN_WIDTH/CGFloat(items.count)
        
        if !hasTab {
            self.delegate = delegate
            for i in 0...items.count - 1 {
                let tab: GTabIndicatorTab = GTabIndicatorTab(frame: CGRect(x: CGFloat(i) * widthPerTab, y: 0, width: widthPerTab, height: self.frame.size.height))
                tab.tag = i
                tab.text = items[i]
                let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GIndicatorTabView.click(_ :)))
                tapGesture.numberOfTapsRequired = 1
                tapGesture.numberOfTouchesRequired = 1
                if i == self.currentTabIndex{
                    tab.toggle(true)
                }else{
                    tab.toggle(false)
                }
                tab.addGestureRecognizer(tapGesture)
                self.addSubview(tab)
            }
            indicator.frame = CGRect(x: CGFloat(currentTabIndex) * widthPerTab, y: frame.size.height - indicatorHeight, width: widthPerTab, height: indicatorHeight)
            indicator.backgroundColor = UIColor.init(hex: "#FD6D6D")
            indicator.tag = indicatorTag
            self.addSubview(indicator)
            hasTab = true
        }else{
            indicator.frame = CGRect(x: CGFloat(currentTabIndex) * widthPerTab, y: frame.size.height - indicatorHeight, width: widthPerTab, height: indicatorHeight)
        }
    }
    
    @objc func click(_ sender: UITapGestureRecognizer){
        let tab: GTabIndicatorTab = sender.view as! GTabIndicatorTab
        currentTabIndex = tab.tag
        for view in subviews{
            if let tab: GTabIndicatorTab = view as? GTabIndicatorTab{
                tab.toggle(false)
            }
        }
        moveIndicatorToTab(tab){ success in
            self.delegate?.indicatorTab(self, self.currentTabIndex)
        }
    }
    
    func moveIndicatorToTab(_ tab: GTabIndicatorTab, completion: ((Bool) -> Void)?){
        UIView.animate(withDuration: 0.2, animations: {
            self.indicator.frame.origin.x = tab.frame.origin.x
        }){ success in
            tab.toggle(true)
            completion?(success)
        }
    }
    
    func clickAtTab(_ index: Int){
        let tab:GTabIndicatorTab = self.viewWithTag(index) as! GTabIndicatorTab
        currentTabIndex = tab.tag
        for view in subviews{
            if let tab: GTabIndicatorTab = view as? GTabIndicatorTab{
                tab.toggle(false)
            }
            moveIndicatorToTab(tab){ success in
                self.delegate?.indicatorTab(self, self.currentTabIndex)
            }
        }
    }
    
    func highLightTab(_ index: Int){
        let tab: GTabIndicatorTab = self.viewWithTag(index) as! GTabIndicatorTab
        currentTabIndex = tab.tag
        for view in subviews{
            if let tab: GTabIndicatorTab = view as? GTabIndicatorTab{
                tab.toggle(false)
            }
        }
        self.indicator.frame.origin.x = tab.frame.origin.x
        tab.toggle(true)
    }
    
}

class GTabIndicatorTab: UILabel{
    let selectedFont: UIFont = UIFont(name: "Arial", size: 13)!
    let normalFont: UIFont = UIFont(name: "Arial", size: 13)!
    var isSelected:Bool = false
    
    override init(frame:CGRect){
        super.init(frame: frame)
        font = normalFont
        textAlignment = .center
        backgroundColor = UIColor.white
        isUserInteractionEnabled = true
        isEnabled = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Squall is number one!")
    }
    
    func  toggle(_ xSelected: Bool)  {
        self.isSelected = xSelected
        if xSelected{
            font = selectedFont
            textColor = UIColor.black
        }else{
            font = normalFont
            textColor = UIColor.init(hex: "#C8CDD0")
        }
    }
}


