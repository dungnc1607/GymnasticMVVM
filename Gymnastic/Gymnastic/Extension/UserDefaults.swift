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
    func saveChartData(_ dict:[String:Any] ){
//        var saveDataDict: [String: Any] = [:]
//        saveDataDict = getChartData()
//        let num = saveDataDict.count >= 1 ? saveDataDict.count  : 0
//        var myDict:[String:Any] = [:]
//        myDict = [
//            "chart\(num)":
//             [
//                "time": time,
//                "weight": weight,
//                "smm": SMM,
//                "bfm": BFM
//             ]
//        ] as [String:Any]
//        let combinedDict:[String: Any] = saveDataDict.merged(another: myDict)
//        self.set(combinedDict, forKey: SAVE_CHART_DATA)
//        self.synchronize()
        self.set(dict, forKey: SAVE_CHART_DATA)
        self.synchronize()
    }
    
    
    // MARK: - GET DATA
    func getChartData() -> [String:Any]{
        guard self.object(forKey: SAVE_CHART_DATA) != nil else{
            return [:]
        }
        return self.object(forKey: SAVE_CHART_DATA) as! [String:Any]
    }
    
    func removeData(){
        self.removeObject(forKey: SAVE_CHART_DATA)
    }
    
}

extension Dictionary{
    func merged(another: [Key: Value]) -> Dictionary {
        var result: [Key: Value] = [:]
        for (key, value) in self {
            result[key] = value
        }
        for (key, value) in another {
            result[key] = value
        }
        return result
    }
}
