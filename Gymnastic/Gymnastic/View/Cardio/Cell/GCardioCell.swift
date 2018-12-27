//
//  GCardioCell.swift
//  Gymnastic
//
//  Created by Squall on 12/26/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit

class GCardioCell: UITableViewCell {

    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var labelName: UILabel!
    var onClickCell:(()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        borderView.layer.cornerRadius = borderView.bounds.height/2
        borderView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionPressCell(_ sender: Any) {
        onClickCell?()
    }
}
