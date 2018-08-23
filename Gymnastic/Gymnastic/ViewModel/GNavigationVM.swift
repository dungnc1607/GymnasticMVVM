//
//  GNavigationVM.swift
//  Gymnastic
//
//  Created by Tran Manh Quy on 8/21/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit

protocol GNavigationVMProtocol {
	func push(_ vc: GBaseView)
	func pop(_ toRoot: Bool)
	func popTo(_ vc: GBaseView)
}

class GNavigationVM: GBaseViewModel {

}


