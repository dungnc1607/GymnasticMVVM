//
//  GBaseViewModel.swift
//  Gymnastic
//
//  Created by Tran Manh Quy on 8/21/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit

class GBaseViewModel: NSObject {
	weak var ownerView: GBaseView?
	
	init(_ ownerView: GBaseView){
		self.ownerView = ownerView
	}
}
