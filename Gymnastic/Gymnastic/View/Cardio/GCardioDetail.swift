//
//  GCardioDetail.swift
//  Gymnastic
//
//  Created by Squall on 12/26/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit

class GCardioDetail: GBaseView {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var a1: UILabel!
    @IBOutlet weak var a2: UILabel!
    @IBOutlet weak var a3: UILabel!
    @IBOutlet weak var a4: UILabel!
    @IBOutlet weak var a5: UILabel!
    
    @IBOutlet weak var r1: UILabel!
    @IBOutlet weak var r2: UILabel!
    @IBOutlet weak var r3: UILabel!
    @IBOutlet weak var r4: UILabel!
    @IBOutlet weak var r5: UILabel!
    
    @IBOutlet weak var dialog: UIView!
    @IBOutlet weak var labelSet: UILabel!
    
    var aArr:[String]?
    var rArr:[String]?
    
    var nameArr:[UILabel]?
    var repArr:[UILabel]?
    var name:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = name
        dialog.layer.cornerRadius = 6
        var nameArr:[UILabel] = [a1, a2, a3, a4, a5]
        var repArr:[UILabel] = [r1, r2, r3, r4, r5]
        for i in 0...4{
            nameArr[i].text = aArr![i]
            repArr[i].text = rArr![i]
        }
        labelSet.text = "30s between exercises, 90s between rounds - 6 ROUND"
    }



}
