//
//  GBaseView.swift
//  Gymnastic
//
//  Created by Tran Manh Quy on 8/21/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit

class GBaseView: UIViewController, GNavigationVMProtocol {

	var vmNavigation: GNavigationVM?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setNeedsStatusBarAppearanceUpdate()
		vmNavigation = GNavigationVM(self)
		setupForTabBar()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func push(_ vc: GBaseView) {
		navigationController?.pushViewController(vc, animated: true )
	}
	
	func pop(_ toRoot: Bool) {
		if toRoot{
			navigationController?.popToRootViewController(animated: true)
		}else{
			navigationController?.popViewController(animated: true)
		}
	}
	
	func popTo(_ vc: GBaseView) {
		navigationController?.popToViewController(vc, animated: true)
	}

	//MARK: - Setup function
	func setupForTabBar() {
		title = self.objectName
		navigationItem.leftBarButtonItem = nil
		navigationItem.rightBarButtonItem = nil
		navigationItem.hidesBackButton = true
		if (navigationController?.viewControllers.count)! > 1 {
			let leftCloseButton: UIBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(selfClose))
			navigationItem.leftBarButtonItem = leftCloseButton
		}
	}
	
	//MARK: - Objc function
	@objc func selfClose() {
		navigationController?.popViewController(animated: true)
	}
}
