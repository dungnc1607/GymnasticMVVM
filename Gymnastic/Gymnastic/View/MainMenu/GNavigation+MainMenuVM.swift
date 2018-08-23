//
//  GNavigation+MainMenuVM.swift
//  Gymnastic
//
//  Created by Tran Manh Quy on 8/23/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import Foundation

extension GNavigationVM {
	
	func openCardio() {
		let vc: GCardioView = GCardioView(nibName: GCardioView.typeName, bundle: nil)
		ownerView?.push(vc)
	}
	
	func openHistory() {
		let vc: GHistoryView = GHistoryView(nibName: GHistoryView.typeName, bundle: nil)
		ownerView?.push(vc)
	}
	
	func openReport() {
		let vc: GReportView = GReportView(nibName: GReportView.typeName, bundle: nil)
		ownerView?.push(vc)
	}
	
	func openSynchronize() {
		let vc: GSynchronizeView = GSynchronizeView(nibName: GSynchronizeView.typeName, bundle: nil)
		ownerView?.push(vc)
	}
}
