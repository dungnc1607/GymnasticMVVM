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
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func open(vc: GBaseView) {
		navigationController?.pushViewController(vc, animated: true )
	}
	
	func close(toRoot: Bool) {
		if toRoot{
			navigationController?.popToRootViewController(animated: true)
		}else{
			navigationController?.popViewController(animated: true)
		}
	}
	
	func closeToVC(_ vc: GBaseView) {
		navigationController?.popToViewController(vc, animated: true)
	}

}
