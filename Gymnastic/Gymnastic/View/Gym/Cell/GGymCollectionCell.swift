//
//  GGymCollectionCell.swift
//  Gymnastic
//
//  Created by Tran Manh Quy on 8/23/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit

class GGymCollectionCell: UICollectionViewCell {
	@IBOutlet weak var iconMuscle: UIImageView!
	@IBOutlet weak var labelMuscleName: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		layer.cornerRadius = 8.0
		layer.borderWidth = 0.5
		layer.borderColor = UIColor(hex: "#c9c9c9").cgColor
    }

	func updateContent(_ muscleIcon: String, _ muscleName: String) {
		iconMuscle.image = UIImage(named: muscleIcon)
		labelMuscleName.text = muscleName
	}
}
