//
//  GExerciseView.swift
//  Gymnastic
//
//  Created by Squall on 8/24/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit

class GExerciseView: GBaseView {
    
    var dumbbellExercise: [String] = []
    var dumbbell_ID: [String] = []
    var barbellExercise: [String] = []
    var barbell_ID: [String] = []
    var barehandExercise: [String] = []
    var barehand_ID: [String] = []
    var cableExercise: [String] = []
    var cable_ID: [String] = []    

    @IBOutlet weak var indicatorTab: GIndicatorTabView!
    @IBOutlet weak var tableview: UITableView!
    var displayIndicatorType: EXERCISE_TAB = .NONE
    var kindOfExercise: String = ""
    
    var cellHeight: CGFloat { return GExerciseCell.loadNib().frame.size.height }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorTab.createTab(images: ["ic_all_border","ic_barbell","ic_xdumbell","ic_cable","ic_glove"], delegate: self)
        tableview.registerCellNib(GExerciseCell.self)
        self.tableview.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.tableview.dataSource = self
        self.tableview.delegate = self
    }
    
    func updateTableview(){
        
    }
}

extension GExerciseView: GIndicatorTabViewDelegate{
    func indicatorTab(_ indicatorTab: GIndicatorTabView, _ clickAtTabIndex: Int) {
        self.displayIndicatorType = EXERCISE_TAB(rawValue: clickAtTabIndex)!
        self.updateTableview()
        self.tableview.reloadData()
    }
}

extension GExerciseView: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch self.displayIndicatorType {
            case .NONE: return 4
            default: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.displayIndicatorType {
        case .BARBELL:
            return barbellExercise.count
        case .DUMBELL:
            return dumbbellExercise.count
        case .CABLE:
            return cableExercise.count
        case .BAREHAND:
            return barehandExercise.count
        case .NONE:
            switch section {
            case 0: return barbellExercise.count
            case 1: return dumbbellExercise.count
            case 2: return cableExercise.count
            case 3: return barehandExercise.count
            default:
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: GExerciseCell? = tableView.dequeueReusableCell(withIdentifier: GExerciseCell.typeName, for: indexPath) as? GExerciseCell
        if !(cell != nil){
            cell = GExerciseCell(style: UITableViewCellStyle.default, reuseIdentifier: GExerciseCell.typeName)
        }
        
        switch self.displayIndicatorType {
        case .BARBELL:
            cell?.labelExerciseName.text = barbellExercise[indexPath.row]
            cell?.onPressCell = {
                self.vmNavigation?.openDetail(self.barbell_ID[indexPath.row])
            }
        case .DUMBELL:
            cell?.labelExerciseName.text = dumbbellExercise[indexPath.row]
            cell?.onPressCell = {
                self.vmNavigation?.openDetail(self.dumbbell_ID[indexPath.row])
            }
        case .CABLE:
            cell?.labelExerciseName.text = cableExercise[indexPath.row]
            cell?.onPressCell = {
                self.vmNavigation?.openDetail(self.cable_ID[indexPath.row])
            }
        case .BAREHAND:
            cell?.labelExerciseName.text = barehandExercise[indexPath.row]
            cell?.onPressCell = {
                self.vmNavigation?.openDetail(self.barehand_ID[indexPath.row])
            }
        case .NONE:
            switch indexPath.section {
            case 0:
                cell?.labelExerciseName.text = barbellExercise[indexPath.row]
                cell?.onPressCell = {
                    self.vmNavigation?.openDetail(self.barbell_ID[indexPath.row])
                }
            case 1:
                cell?.labelExerciseName.text = dumbbellExercise[indexPath.row]
                cell?.onPressCell = {
                    self.vmNavigation?.openDetail(self.dumbbell_ID[indexPath.row])
                }
            case 2:
                cell?.labelExerciseName.text = cableExercise[indexPath.row]
                cell?.onPressCell = {
                    self.vmNavigation?.openDetail(self.cable_ID[indexPath.row])
                }
            case 3:
                cell?.labelExerciseName.text = barehandExercise[indexPath.row]
                cell?.onPressCell = {
                    self.vmNavigation?.openDetail(self.barehand_ID[indexPath.row])
                }
            default:
                break
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
