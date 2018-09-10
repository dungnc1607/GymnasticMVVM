//
//  GNavigation+GymView.swift
//  Gymnastic
//
//  Created by Squall on 8/24/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import Foundation

extension GNavigationVM{
    func openExercise(_ kindOfExercise:KIND_OF_MUSCLE){
        let vc: GExerciseView = GExerciseView(nibName: GExerciseView.typeName, bundle: nil)
        switch kindOfExercise {
        case .NONE:
            break
        case .CHEST:
            vc.dumbbellExercise = CHEST_DUMBBELL
            vc.dumbbell_ID = CHEST_DUMBBELL_ID
            vc.barbellExercise = CHEST_BARBELL
            vc.barbell_ID = CHEST_BARBELL_ID
            vc.barehandExercise = CHEST_BAREHAND
            vc.barehand_ID = CHEST_BAREHAND_ID
            vc.cableExercise = CHEST_CABLE
            vc.cable_ID = CHEST_CABLE_ID
        case .SHOULDER:
            vc.dumbbellExercise = SHOULDER_DUMBBELL
            vc.dumbbell_ID = SHOULDER_DUMBBELL_ID
            vc.barbellExercise = SHOULDER_BARBELL
            vc.barbell_ID = SHOULDER_BARBELL_ID
            vc.barehandExercise = SHOULDER_BAREHAND
            vc.barehand_ID = SHOULDER_BAREHAND_ID
            vc.cableExercise = SHOULDER_CABLE
            vc.cable_ID = SHOULDER_CABLE_ID
        case .BACK:
            vc.dumbbellExercise = BACK_DUMBBELL
            vc.dumbbell_ID = BACK_DUMBBELL_ID
            vc.barbellExercise = BACK_BARBELL
            vc.barbell_ID = BACK_BARBELL_ID
            vc.barehandExercise = BACK_BAREHAND
            vc.barehand_ID = BACK_BAREHAND_ID
            vc.cableExercise = BACK_CABLE
            vc.cable_ID = BACK_CABLE_ID
        case .HAND:
            vc.dumbbellExercise = HAND_DUMBBELL
            vc.dumbbell_ID = HAND_DUMBBELL_ID
            vc.barbellExercise = HAND_BARBELL
            vc.barbell_ID = HAND_BARBELL_ID
            vc.barehandExercise = HAND_BAREHAND
            vc.barehand_ID = HAND_BAREHAND_ID
            vc.cableExercise = HAND_CABLE
            vc.cable_ID = HAND_CABLE_ID
        case .LEG:
            vc.dumbbellExercise = LEG_DUMBBELL
            vc.dumbbell_ID = LEG_DUMBBELL_ID
            vc.barbellExercise = LEG_BARBELL
            vc.barbell_ID = LEG_BARBELL_ID
            vc.barehandExercise = LEG_BAREHAND
            vc.barehand_ID = LEG_BAREHAND_ID
            vc.cableExercise = LEG_CABLE
            vc.cable_ID = LEG_CABLE_ID
        case .CORE:
            vc.dumbbellExercise = CORE_DUMBBELL
            vc.dumbbell_ID = CORE_DUMBBELL_ID
            vc.barbellExercise = CORE_BARBELL
            vc.barbell_ID = CORE_BARBELL_ID
            vc.barehandExercise = CORE_BAREHAND
            vc.barehand_ID = CORE_BAREHAND_ID
            vc.cableExercise = CORE_CABLE
            vc.cable_ID = CORE_CABLE_ID
        }
        ownerView?.push(vc)
    }
}
