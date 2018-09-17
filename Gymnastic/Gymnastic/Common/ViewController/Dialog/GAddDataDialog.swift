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
        if textfieldWeight.text == "" || textfieldSMM.text == "" || textfieldBFM.text == "" {
            //TODO: Push Notification ERROR!
        }else{
            let date = Date()
            let calender = Calendar.current
            let components = calender.dateComponents([.year,.month,.day], from: date)
            let month = components.month
            let day = components.day
            let monthStr = month! < 10 ? "0\(month!)" : "\(month!)"
            let dayStr = day! < 10 ? "0\(day!)" : "\(day!)"
            let time = monthStr + "/" + dayStr
            
            
            
            UserDefaults.standard.saveChartData(time, (textfieldWeight.text?.toDouble())!, ((textfieldSMM.text)?.toDouble())!, ((textfieldBFM.text)?.toDouble())!)
            self.dismiss()
        }
    }
    @IBAction func actionPressCancel(_ sender: Any) {
        self.dismiss()
    }
}


