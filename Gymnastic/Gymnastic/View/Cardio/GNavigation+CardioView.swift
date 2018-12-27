//
//  GNavigation+CardioView.swift
//  Gymnastic
//
//  Created by Squall on 12/26/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit

extension GNavigationVM{
    func openCardio(_ index:Int){
        let vc: GCardioDetail = GCardioDetail(nibName:GCardioDetail.typeName, bundle:nil)
        switch index {
        case 0:
            vc.aArr = FULL_BODY_KICK
            vc.rArr = FULL_BODY_REP
            vc.name = CARDIO_NAME[index]
        case 1:
            vc.aArr = INSANE_CARDIO
            vc.rArr = INSANE_REP
            vc.name = CARDIO_NAME[index]
        case 2:
            vc.aArr = HIIT_BURNER
            vc.rArr = HIIT_REP
            vc.name = CARDIO_NAME[index]
        case 3:
            vc.aArr = QUAD_FLY
            vc.rArr = QUAD_REP
            vc.name = CARDIO_NAME[index]
        default:
            return
        }
        ownerView?.push(vc)
    }
}
