//
//  GMainMenuView.swift
//  Gymnastic
//
//  Created by Tran Manh Quy on 8/22/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit

class GMainMenuView: GBaseView {
	
	@IBOutlet weak var tableView: UITableView!
	
	let menuList: [String] = ["Cardio","Report","Synchronize"]
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func setupTableView() {
		tableView.registerCellNib(GMainMenuTableCell.self)
        tableView.tableFooterView = UIView()
	}
}

// MARK: - UITableViewDelegate & DataSource
extension GMainMenuView: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return menuList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: GMainMenuTableCell.typeName, for: indexPath) as? GMainMenuTableCell
		if !(cell != nil) {
			cell = GMainMenuTableCell(style: .default, reuseIdentifier: GMainMenuTableCell.typeName)
		}
		cell?.updateContent(menuList[indexPath.row])
		return cell!
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 40
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let menuIndex: MENU_INDEX = MENU_INDEX(rawValue: indexPath.row)!
		switch menuIndex {
		case .CARDIO:
			self.vmNavigation?.openCardio()
		case .REPORT:
			self.vmNavigation?.openReport()
		case .SYNCHRONIZE:
			self.vmNavigation?.openSynchronize()
		}
        tableView.deselectRow(at: indexPath, animated: true)
	}
}
