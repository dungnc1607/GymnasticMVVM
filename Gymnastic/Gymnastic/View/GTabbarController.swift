//
//  GTabbarController.swift
//  Gymnastic
//
//  Created by Tran Manh Quy on 8/22/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit

class GTabbarController: UITabBarController {
	
	func createView() {
		let viewList = createViewList()
		self.viewControllers = viewList
		self.customizableViewControllers = viewList
	}
	
	private func createViewList() -> [UIViewController] {
        let appearance = UITabBarItem.appearance()
		let gymView = GGymView(nibName: GGymView.typeName, bundle: nil)
		let mainMenuView = GMainMenuView(nibName: GMainMenuView.typeName, bundle: nil)
		
		let navGym = UINavigationController(rootViewController: gymView)
		let navMainMenu = UINavigationController(rootViewController: mainMenuView)
		
		let tabBarItemGym = UITabBarItem(title: gymView.objectName.localizable, image: UIImage(named: "ic_dumbell")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "ic_selected_dumbell")?.withRenderingMode(.alwaysOriginal))
		tabBarItemGym.imageInsets = UIEdgeInsets.zero
		gymView.tabBarItem = tabBarItemGym
		
		let tbiMainMenu = UITabBarItem(title: mainMenuView.objectName.localizable, image: UIImage(named: "icon_menu")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icon_menu_selected")?.withRenderingMode(.alwaysOriginal))
		tbiMainMenu.imageInsets = UIEdgeInsets.zero
		mainMenuView.tabBarItem = tbiMainMenu
        
        appearance.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Arial", size: 13)!, NSAttributedStringKey.foregroundColor: UIColor(hex: "000000")], for: .normal)
        appearance.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Arial", size: 13)!, NSAttributedStringKey.foregroundColor: UIColor(hex: "1b59ff")], for: .selected)
		
		return [navGym,navMainMenu]
	}
}
