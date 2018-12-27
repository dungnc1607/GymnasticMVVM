//
//  GAddDataDialog.swift
//  Gymnastic
//
//  Created by Squall on 9/11/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit

class GAddDataDialog: GBaseDialog {

    @IBOutlet weak var mainDialog: UIView!
    @IBOutlet weak var buttonShowChart: UIButton!
    @IBOutlet weak var textfieldWeight: UITextField!
    @IBOutlet weak var textfieldSMM: UITextField!
    @IBOutlet weak var textfieldBFM: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainDialog.layer.cornerRadius = 6
        self.mainDialog.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func actionPressButtonShowChart(_ sender: Any) {
        if textfieldWeight.text == "" || textfieldSMM.text == "" || textfieldBFM.text == ""{
            self.dismiss()
            GUtility.alertToUser("Còn ô bỏ trống kìa bố, nhập số liệu vào!!", self)
        }else{
            if let w = Double(textfieldWeight.text!), let smm = Double(textfieldSMM.text!), let bfm = Double(textfieldBFM.text!){
                let date = Date()
                let calender = Calendar.current
                let components = calender.dateComponents([.year,.month,.day], from: date)
                let month = components.month
                let day = components.day
                let monthStr = month! < 10 ? "0\(month!)" : "\(month!)"
                let dayStr = day! < 10 ? "0\(day!)" : "\(day!)"
                let time = monthStr + "/" + dayStr
                
                var myDict:[String:Any] = UserDefaults.standard.getChartData()
                let num = myDict.count >= 1 ? myDict.count  : 0
                myDict["chart\(num)"] = [
                    "time": time,
                    "weight": (textfieldWeight.text?.toDouble())!,
                    "smm": ((textfieldSMM.text)?.toDouble())!,
                    "bfm": ((textfieldBFM.text)?.toDouble())!
                ]
                UserDefaults.standard.saveChartData(myDict)
                self.dismiss()
            } else{
                //TODO: Push Notification ERROR!
                self.dismiss()
               GUtility.alertToUser("Ơ đệt! nhập số cơ mà!??", self)
            }
        }
    }
    @IBAction func actionPressCancel(_ sender: Any) {
        self.dismiss()
    }
}


