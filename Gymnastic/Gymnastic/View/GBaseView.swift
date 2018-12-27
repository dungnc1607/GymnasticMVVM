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
    var navigationButtonType:navigationButtonType = .NONE
    
    
	override func viewDidLoad() {
		super.viewDidLoad()
		setNeedsStatusBarAppearanceUpdate()
		vmNavigation = GNavigationVM(self)
		setupForTabBar()
        setupNavigationBarItems()
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
		title = self.objectName.localizable
		navigationItem.leftBarButtonItem = nil
		navigationItem.rightBarButtonItem = nil
		navigationItem.hidesBackButton = true
		if (navigationController?.viewControllers.count)! > 1 {
			let leftCloseButton: UIBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(selfClose))
			navigationItem.leftBarButtonItem = leftCloseButton
		}
	}
	
    func setupNavigationBarItems(){
        navigationItem.leftBarButtonItem = nil
        navigationItem.rightBarButtonItem = nil
        
        switch navigationButtonType {
        case .NONE:
            break
        case .BLUE_BIN:
            createBlueBin()
        case .BLUE_PLUS:
            createBluePlus()
        
        }
    }
    
    //MARK: - Create navigation bar item
    func createBlueBin(){
        let leftButton:UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_bin"), style: .plain, target: self, action: #selector(selfDelete))
        leftButton.tintColor = COLOR_NAVIGATIONBAR_BUTTON
        navigationItem.leftBarButtonItem = leftButton
    }
    
    func createBluePlus(){
        let rightButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_plus"), style: .plain, target: self, action: #selector(addNewChart))
        rightButton.tintColor = COLOR_NAVIGATIONBAR_BUTTON
        navigationItem.rightBarButtonItem = rightButton
    }
    
	//MARK: - Objc function
	@objc func selfClose() {
		navigationController?.popViewController(animated: true)
	}
    
    @objc func selfDelete(){
        
    }
    
    @objc func addNewChart(){
        let dialog:GAddDataDialog = GAddDataDialog(nibName: GAddDataDialog.typeName, bundle: nil)
        dialog.showDialog(completion: nil)
        dialog.dismissCompletion = {
            let vc:GReportView = GReportView(nibName: GReportView.typeName, bundle: nil)
            vc.navigationButtonType = .BLUE_PLUS
            self.navigationController?.pushViewController(vc, animated: false )
            NotificationCenter.default.post(name: Notification.Name(rawValue: GNotifyCreateANewChart), object: nil)
            
        }
        
        
    }
}
