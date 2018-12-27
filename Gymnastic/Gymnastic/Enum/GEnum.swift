//
//  GEnum.swift
//  Gymnastic
//
//  Created by Tran Manh Quy on 8/23/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import Foundation

enum MENU_INDEX: Int {
	case CARDIO
	case REPORT
	case SYNCHRONIZE
}

enum EXERCISE_TAB:Int{
    case NONE
    case BARBELL
    case DUMBELL
    case CABLE
    case BAREHAND
}

enum KIND_OF_MUSCLE:Int{
    case NONE
    case CHEST
    case SHOULDER
    case BACK
    case HAND
    case LEG
    case CORE
}

// - MARK: Navigation bar
enum navigationButtonType: Int{
    case NONE = 0,
    BLUE_PLUS,
    BLUE_BIN
}
