//
//  GNavigationVM.swift
//  Gymnastic
//
//  Created by Tran Manh Quy on 8/21/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit

protocol GNavigationVMProtocol {
	func open(vc: GBaseView)
	func close(toRoot: Bool)
	func closeToVC(_ vc: GBaseView)
}

class GNavigationVM: GBaseViewModel {

}


