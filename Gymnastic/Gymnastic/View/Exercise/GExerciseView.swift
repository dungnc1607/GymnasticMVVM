//
//  GExerciseView.swift
//  Gymnastic
//
//  Created by Squall on 8/24/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit

class GExerciseView: GBaseView {

    @IBOutlet weak var indicatorTab: GIndicatorTabView!
    @IBOutlet weak var tableview: UITableView!
    var displayIndicatorType: EXERCISE_TAB = .BARBELL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorTab.createTab(["a", "b", "c", "d"], delegate: self)
        
    }
    
    func updateHeaderView(){
//        switch self.displayIndicatorType {
//        case .BARBELL:
//            var newFrame = self
//        case .DUMBELL:
//        case .CABLE:
//        case .BAREHAND:
        
    }
}

extension GExerciseView: GIndicatorTabViewDelegate{
    func indicatorTab(_ indicatorTab: GIndicatorTabView, _ clickAtTabIndex: Int) {
        self.displayIndicatorType = EXERCISE_TAB(rawValue: clickAtTabIndex)!
        self.updateHeaderView()
        self.tableview.reloadData()
    }
}
