//
//  GNavigation+GymView.swift
//  Gymnastic
//
//  Created by Squall on 8/24/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import Foundation

extension GNavigationVM{
    func openExercise(){
        let vc: GExerciseView = GExerciseView(nibName: GExerciseView.typeName, bundle: nil)
        ownerView?.push(vc)
    }
}
