//
//  GComboBoxCell.swift
//  Gymnastic
//
//  Created by Squall on 9/14/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit

class GComboBoxCell: UITableViewCell {

    @IBOutlet weak var labelDate: UILabel!
    var onPressItem:(()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionPressComboBoxItem(_ sender: Any) {
        onPressItem?()
    }
    
}
