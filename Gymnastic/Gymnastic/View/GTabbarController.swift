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
		let gymView = GGymView(nibName: GGymView.typeName, bundle: nil)
		let mainMenuView = GMainMenuView(nibName: GMainMenuView.typeName, bundle: nil)
		
		let navGym = UINavigationController(rootViewController: gymView)
		let navMainMenu = UINavigationController(rootViewController: mainMenuView)
		
		let tabBarItemGym = UITabBarItem(title: "Gym", image: UIImage(named: "ic_dumbell")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "ic_selected_dumbell")?.withRenderingMode(.alwaysOriginal))
		tabBarItemGym.imageInsets = UIEdgeInsets.zero
		gymView.tabBarItem = tabBarItemGym
		
		let tbiMainMenu = UITabBarItem(title: "Menu", image: UIImage(named: "icon_menu")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icon_menu_selected")?.withRenderingMode(.alwaysOriginal))
		tbiMainMenu.imageInsets = UIEdgeInsets.zero
		mainMenuView.tabBarItem = tbiMainMenu
		
		return [navGym,navMainMenu]
	}
}
