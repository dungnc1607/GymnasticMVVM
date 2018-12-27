//
//  GReportView.swift
//  Gymnastic
//
//  Created by Tran Manh Quy on 8/22/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit
import Charts
import UserNotifications
class GReportView: GBaseView {
    @IBOutlet weak var heightOfDropDown: NSLayoutConstraint!
    
    @IBOutlet weak var comboBox: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pieChart: PieChartView!
    var smmDataEntry = PieChartDataEntry(value: 0)
    var bfmDataEntry = PieChartDataEntry(value: 0)
    var otherDataEntry = PieChartDataEntry(value: 0)
    var totalDataEntry = [PieChartDataEntry]()
    var temp:Int = 0
    var w:Double?
    var smm:Double?
    var bfm:Double?
    var other:Double?
    var inbodyDict = UserDefaults.standard.getChartData()
    
    
    var isOpen:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //For the add new function
        if inbodyDict.count > 0 {
            NotificationCenter.default.addObserver(self, selector: #selector(drawChartInstantly) , name: Notification.Name(rawValue: GNotifyCreateANewChart), object: nil)
        }
        tableView.registerCellNib(GComboBoxCell.self)
        self.tableView.isHidden = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        heightOfDropDown.constant = CGFloat(inbodyDict.count * 30)
        LocalNotificationManager.shared.sendLocalNotification()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        print(inbodyDict)
//        for i in 0...inbodyDict.count - 1 {
//            
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @objc func drawChartInstantly() {
        var theLastValue:[String:Any] = inbodyDict["chart\(inbodyDict.count - 1)"] as! [String : Any]
        let w = theLastValue["weight"] as! Double
        let smm = theLastValue["smm"] as! Double
        let bfm = theLastValue["bfm"] as! Double
        let o = w - smm - bfm
        drawChart(inbodyDict.count - 1, w, smm, bfm, o)
    }
    
    func drawChart(_ chartNumber:Int, _ weight: Double, _ smm: Double, _ bfm: Double, _ other: Double){
        self.smmDataEntry.value = smm
        self.smmDataEntry.label = "SMM"
        
        self.bfmDataEntry.value = bfm
        self.bfmDataEntry.label = "BFM"
        
        self.otherDataEntry.value = other
        self.otherDataEntry.label = "Other"
        self.totalDataEntry = [self.smmDataEntry, self.bfmDataEntry, self.otherDataEntry]
        
        //Draw
        let chartDataSet = PieChartDataSet(values: totalDataEntry, label: "TOTAL WEIGHT : \(String(weight))kg")
        pieChart.drawHoleEnabled = false
        pieChart.chartDescription?.enabled = false
        pieChart.setNeedsDisplay()
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors = [UIColor(hex: "#922d20"), UIColor(hex: "#267FF8"), UIColor(hex: "#7F7F7F")]
        chartDataSet.colors = colors
        pieChart.data = chartData
    }

   
    @IBAction func actionPressComboBox(_ sender: Any) {
        if inbodyDict.count == 0{
            
        }
        else{
            if isOpen == false{
                isOpen = true
                UIView.animate(withDuration: 0.5, animations: {
                    self.tableView.isHidden = false
                })
            }else{
                isOpen = false
                UIView.animate(withDuration: 0.5, animations: {
                    self.tableView.isHidden = true
                })
            }
        }
        
    }
    
}

extension GReportView:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inbodyDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:GComboBoxCell? = tableView.dequeueReusableCell(withIdentifier: GComboBoxCell.typeName, for: indexPath) as? GComboBoxCell
        cell?.labelDate?.text = (inbodyDict["chart\(indexPath.row)"] as! Dictionary<String, Any>)["time"] as? String

        cell?.onPressItem = {
            //Draw chart
            self.w = (self.inbodyDict["chart\(indexPath.row)"] as! Dictionary<String, Any>)["weight"] as? Double
            self.smm = (self.inbodyDict["chart\(indexPath.row)"] as! Dictionary<String, Any>)["smm"] as? Double
            self.bfm = (self.inbodyDict["chart\(indexPath.row)"] as! Dictionary<String, Any>)["bfm"] as? Double
            self.other =  self.w! - ( self.smm! + self.bfm! )
            self.drawChart(indexPath.row, self.w!, self.smm!, self.bfm!, self.other!)
            tableView.isHidden = true
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        comboBox.setTitle((inbodyDict["chart\(indexPath.row)"] as! Dictionary<String, Any>)["time"] as? String, for: .normal)
        tableView.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            inbodyDict.remove(at: inbodyDict.index(forKey: "chart\(indexPath.row)")!)
            tableView.deleteRows(at: [indexPath], with: .fade)
            UserDefaults.standard.saveChartData(inbodyDict)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}



