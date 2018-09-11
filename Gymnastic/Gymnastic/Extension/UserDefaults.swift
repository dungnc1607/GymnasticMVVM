//
//  UserDefaults.swift
//  Gymnastic
//
//  Created by Squall on 9/11/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit
let SAVE_CHART_DATA = "save_data"
extension UserDefaults{
    // MARK: - SAVE DATA
    func saveChartData(_ weight:Double, _ SMM:Double, _ BFM:Double ){
        let myDict = [
            "weight": weight,
            "smm": SMM,
            "bfm": BFM
        ] as [String:Any]
        self.set(myDict, forKey: SAVE_CHART_DATA)
        self.synchronize()
    }
    
    
    // MARK: - GET DATA
    func getChartData() -> [String:Any]{
        guard self.object(forKey: SAVE_CHART_DATA) != nil else{
            return [:]
        }
        return self.object(forKey: SAVE_CHART_DATA) as! [String:Any]
    }
}
