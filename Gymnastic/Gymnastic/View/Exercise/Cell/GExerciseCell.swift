//
//  GExerciseCell.swift
//  Gymnastic
//
//  Created by Squall on 8/27/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit

class GExerciseCell: UITableViewCell {

    @IBOutlet weak var imageIcon: UIButton!
    @IBOutlet weak var labelExerciseName: UILabel!
    var onPressCell:(()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func actionPressCell(_ sender: Any) {
        onPressCell?()
    }
    
}
