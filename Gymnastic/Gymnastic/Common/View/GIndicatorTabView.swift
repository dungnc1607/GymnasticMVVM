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
	
	func createTab(images: [String], delegate: GIndicatorTabViewDelegate){
		let widthPerTab: CGFloat = SCREEN_WIDTH/CGFloat(images.count)
		
		if !hasTab {
			self.delegate = delegate
			for i in 0...images.count - 1 {
				let button: GIndicatorButtonTab = GIndicatorButtonTab(frame: CGRect(x: CGFloat(i) * widthPerTab, y: 0, width: widthPerTab, height: self.frame.size.height))
				button.setImage(UIImage(named: images[i]), for: .normal)
				button.addTarget(self, action: #selector(GIndicatorTabView.clickTab(_ :)), for: .touchUpInside)
				button.tag = i
				button.imageName = images[i]
				
				if i == self.currentTabIndex{
					button.toggle(true)
				}else{
					button.toggle(false)
				}
				
				self.addSubview(button)
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
	
	func createTab(items: [String], delegate: GIndicatorTabViewDelegate){
		let widthPerTab: CGFloat = SCREEN_WIDTH/CGFloat(items.count)
		
		if !hasTab {
			self.delegate = delegate
			for i in 0...items.count - 1 {
				let button: GIndicatorButtonTab = GIndicatorButtonTab(frame: CGRect(x: CGFloat(i) * widthPerTab, y: 0, width: widthPerTab, height: self.frame.size.height))
				button.addTarget(self, action: #selector(GIndicatorTabView.clickTab(_ :)), for: .touchUpInside)
				button.tag = i
				button.setTitle(items[i], for: .normal)
				
				if i == self.currentTabIndex{
					button.toggle(true)
				}else{
					button.toggle(false)
				}
				
				self.addSubview(button)
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
	
	@objc func clickTab(_ sender: Any){
		let tab: GIndicatorButtonTab = sender as! GIndicatorButtonTab
		currentTabIndex = tab.tag
		for view in subviews{
			view.toggle(false)
		}
		moveIndicatorToTab(tab){ success in
			self.delegate?.indicatorTab(self, self.currentTabIndex)
		}
	}
	
	func moveIndicatorToTab(_ tab: UIView, completion: ((Bool) -> Void)?){
		UIView.animate(withDuration: 0.2, animations: {
			self.indicator.frame.origin.x = tab.frame.origin.x
		}){ success in
			tab.toggle(true)
			completion?(success)
		}
	}
	
	func clickAtTab(_ index: Int){
		let tab: GIndicatorButtonTab = self.viewWithTag(index) as! GIndicatorButtonTab
		currentTabIndex = tab.tag
		for view in subviews{
				view.toggle(false)
		}
		moveIndicatorToTab(tab){ success in
			self.delegate?.indicatorTab(self, self.currentTabIndex)
		}
	}
	
	func highLightTab(_ index: Int){
		let tab: UIView = self.viewWithTag(index)!
		currentTabIndex = tab.tag
		for view in subviews{
			view.toggle(false)
		}
		self.indicator.frame.origin.x = tab.frame.origin.x
		tab.toggle(true)
	}
}

extension UIView {
	@objc func toggle(_ xSelected: Bool)  {
		print("UIView.toggle()")
	}
}

class GIndicatorButtonTab: UIButton{
	var imageName: String = ""
	let selectedFont: UIFont = UIFont(name: "Arial", size: 13)!
	let normalFont: UIFont = UIFont(name: "Arial", size: 13)!
	
	override init(frame:CGRect){
		super.init(frame: frame)
		titleLabel?.font = normalFont
		titleLabel?.textAlignment = .center
		titleLabel?.textColor = UIColor.black
		titleLabel?.backgroundColor = UIColor.white
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("Squall is number one!")
	}
	
	override func toggle(_ xSelected: Bool)  {
		self.isSelected = xSelected
		if xSelected{
			if imageName.length > 0 {
				setImage(UIImage(named: imageName + "_selected"), for: .normal)
			}
			if titleLabel?.text != nil && (titleLabel?.text)!.count > 0 {
				titleLabel?.font = selectedFont
				titleLabel?.textColor = UIColor.black
			}
		} else {
			if imageName.length > 0 {
				setImage(UIImage(named: imageName), for: .normal)
			}
			if titleLabel?.text != nil && (titleLabel?.text)!.count > 0 {
				titleLabel?.font = normalFont
				titleLabel?.textColor = UIColor.init(hex: "#C8CDD0")
			}
		}
	}
}

//class GIndicatorTextTab: UILabel{
//	let selectedFont: UIFont = UIFont(name: "Arial", size: 13)!
//	let normalFont: UIFont = UIFont(name: "Arial", size: 13)!
//	var isSelected:Bool = false
//
//	override init(frame:CGRect){
//		super.init(frame: frame)
//		font = normalFont
//		textAlignment = .center
//		backgroundColor = UIColor.white
//		isUserInteractionEnabled = true
//		isEnabled = true
//	}
//
//	required init?(coder aDecoder: NSCoder) {
//		fatalError("Squall is number one!")
//	}
//
//	override func toggle(_ xSelected: Bool)  {
//		self.isSelected = xSelected
//		if xSelected{
//			font = selectedFont
//			textColor = UIColor.black
//		}else{
//			font = normalFont
//			textColor = UIColor.init(hex: "#C8CDD0")
//		}
//	}
//}
