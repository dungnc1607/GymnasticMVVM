//
//  GNavigation+ExerciseView.swift
//  Gymnastic
//
//  Created by Squall on 8/27/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import Foundation
extension GNavigationVM{
    func openDetail(_ id:String){
        let vc: GExerciseDetail = GExerciseDetail(nibName: GExerciseDetail.typeName, bundle: nil)
        vc.youtubeID = id
        ownerView?.push(vc)
    }
}
