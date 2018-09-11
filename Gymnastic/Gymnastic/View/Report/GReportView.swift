//
//  GReportView.swift
//  Gymnastic
//
//  Created by Tran Manh Quy on 8/22/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit
import Charts

class GReportView: GBaseView {

    @IBOutlet weak var pieChart: PieChartView!
    var smmDataEntry = PieChartDataEntry(value: 0)
    var bfmDataEntry = PieChartDataEntry(value: 0)
    var otherDataEntry = PieChartDataEntry(value: 0)
    var totalDataEntry = [PieChartDataEntry]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let dialog:GAddDataDialog = GAddDataDialog(nibName: GAddDataDialog.typeName, bundle: nil)
        dialog.showDialog(completion: nil)
        dialog.dismissCompletion = {
            let inbodyDict = UserDefaults.standard.getChartData()
            self.smmDataEntry.value = inbodyDict["smm"] as! Double
            self.smmDataEntry.label = "SMM"
            self.bfmDataEntry.value = inbodyDict["bfm"] as! Double
            self.bfmDataEntry.label = "BFM"
            self.otherDataEntry.value = inbodyDict["weight"] as! Double - self.smmDataEntry.value - self.bfmDataEntry.value
            self.otherDataEntry.label = "Other"
            
            self.totalDataEntry = [self.smmDataEntry, self.bfmDataEntry, self.otherDataEntry]
            self.updateChartData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    func updateChartData(){
        let chartDataSet = PieChartDataSet(values: totalDataEntry, label: "Total")
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors = [UIColor(hex: "#922d20"), UIColor(hex: "#267FF8"), UIColor(hex: "#7F7F7F")]
        chartDataSet.colors = colors
        pieChart.data = chartData
    }

}
