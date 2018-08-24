//
//  GGymView.swift
//  Gymnastic
//
//  Created by Tran Manh Quy on 8/22/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit

let INSET: CGFloat = 20
let CELL_WIDTH: CGFloat = (UIScreen.main.bounds.size.width - 3 * INSET) / 2

class GGymView: GBaseView {

	@IBOutlet weak var collectionView: UICollectionView!
	
	let muscleList: [(String, String)] = [
		("Chest","ic_dumbell"),("Shoulder","ic_dumbell"),
		("Back","ic_dumbell"),("Bicept-Tricept","ic_dumbell"),
		("Leg","ic_dumbell"),("Core","ic_dumbell")
	]
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setupCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func setupCollectionView() {
		collectionView.registerCellNib(GGymCollectionCell.typeName)
	}
}

extension GGymView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return muscleList.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell: GGymCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: GGymCollectionCell.typeName, for: indexPath) as! GGymCollectionCell
		let muscleTuple = muscleList[indexPath.item]
		cell.updateContent(muscleTuple.1, muscleTuple.0)
        cell.onPressCell = {
            self.vmNavigation?.openExercise()
        }
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: CELL_WIDTH, height: CELL_WIDTH)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return INSET
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return INSET
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: INSET, left: INSET, bottom: INSET, right: INSET)
	}
}
