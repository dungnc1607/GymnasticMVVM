//
//  GConstant.swift
//  Gymnastic
//
//  Created by Squall on 8/24/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import Foundation
import UIKit

let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.size.height

//Exercise View
let CHEST_DUMBBELL:[String] = ["Dumbbell bench press", "Incline bench press", "Dumbbell pull over"]
let CHEST_DUMBBELL_ID:[String] = ["Fzn2IdgfF5o", "WY5jYVUggHM", "FsccvG4lh5A"]
let CHEST_BARBELL: [String] = ["Barbell bench press", "Incline barbell bench press", "Lower chest with smith machine"]
let CHEST_BARBELL_ID: [String] = ["i9wiyCFj3R0" , "i9wiyCFj3R0" , "i9wiyCFj3R0"]
let CHEST_BAREHAND: [String] = ["Dips", "Pushup", "Pushup T- shape"]
let CHEST_BAREHAND_ID: [String] = ["dX_nSOOJIsE", "HkCZiPGHzfI", "-SgeUqvNzag"]
let CHEST_CABLE: [String] = ["Pec dec flies", "Cable cross over", "Incline bench cable flies", "Incline chest press machine"]
let CHEST_CABLE_ID: [String] = ["kBcUIiP8fLg", "taI4XduLpTk", "ajdFwa-qM98", "_OodPWexj_g"]

let SHOULDER_DUMBBELL:[String] = ["Leaning Dumbbell Lateral Raise", "Arnold Dumbbell Press"]
let SHOULDER_DUMBBELL_ID:[String] = ["WxAKPTOmYSw", "9BkwLTAB5wc"]
let SHOULDER_BARBELL: [String] = ["Front Barbell Raise", "Smith Machine Upright Row"]
let SHOULDER_BARBELL_ID: [String] = ["Ofo2DQdT7DA", "vcXkzN6QXbk"]
let SHOULDER_BAREHAND: [String] = ["Handstand", "Shoulder Pushup"]
let SHOULDER_BAREHAND_ID: [String] = ["LI_ZFDWtIGk", "gwYDZJW5SLw"]
let SHOULDER_CABLE: [String] = ["Upright cable row", "Cable Front Raise", "Machine Shoulder Press", "Cable Rear-Delt Fly"]
let SHOULDER_CABLE_ID: [String] = ["GTOn4JiBWCQ", "H0O4HNvtB70", "rJVXF2dw9FQ", "kDhyOrL_1io"]

let BACK_DUMBBELL:[String] = ["One-arm Dumbbell Row", "Decline Bench Dumbbell Pull-Over"]
let BACK_DUMBBELL_ID:[String] = ["pYcpY20QaE8", "bA9FNO1szxY"]
let BACK_BARBELL: [String] = ["Barbell Deadlift", "Bent-Over Barbell Deadlift", "Standing T-Bar Row"]
let BACK_BARBELL_ID: [String] = ["RyJbvWAh6ec", "vT2GjY_Umpw", "j3Igk5nyZE4"]
let BACK_BAREHAND: [String] = ["Reverse Flutter Kicks"]
let BACK_BAREHAND_ID: [String] = ["zUT-V36Il-s"]
let BACK_CABLE: [String] = ["Wide-Grip Pull-Up", "Wide-Grip Seated Cable Row", "Reverse-Grip Smith Machine Row", "Close-Grip Pull-Down", "Single-Arm Smith Machine Row", "Hyperextensions"]
let BACK_CABLE_ID: [String] = ["iywjqUo5nmU", "e9oe5qbN0jo", "ZErBUu7Jpz4", "neP32qCyPbQ", "rNTlYT55Sfs", "O8d8I7-qtGg"]

let HAND_DUMBBELL:[String] = ["Dumbbell Alternate Bicep Curl", "Standing One-Arm Dumbbell Triceps Extension", "Alternate Incline Dumbbell Curl", "Hammer Curl"]
let HAND_DUMBBELL_ID:[String] = ["sAq_ocpRh_I", "_gsUck-7M74", "soxrZlIl35U", "zC3nLlEvin4"]
let HAND_BARBELL: [String] = ["Close-Grip Barbell Bench Press", "Barbell Curl", "Palms-Down Wrist Curl Over A Bench", "Lying Triceps Press/Skull Crasher", "Barbell Curls Lying Against An Incline"]
let HAND_BARBELL_ID: [String] = ["nEF0bv2FW94", "QZEqB6wUPxQ", "_xX0S_c_aak", "d_KZxkY_0cM", "MmGjEVLO4kY"]
let HAND_BAREHAND: [String] = ["Bench Dips"]
let HAND_BAREHAND_ID: [String] = ["c3ZGl4pAwZ4"]
let HAND_CABLE: [String] = ["Cable Rope Overhead", "Triceps Pushdown", "Standing Biceps Cable Curl", "Lying Cable Curl", "Cable Wrist Curl"]
let HAND_CABLE_ID: [String] = ["XTerYx0kwQ8", "2-LAMcpzODU", "85kXYq7Ssh4", "khyjpRPUEB0", "riolKbyWpWk"]

let LEG_DUMBBELL:[String] = ["Dumbbell Lunges"]
let LEG_DUMBBELL_ID:[String] = ["D7KaRcUTQeE"]
let LEG_BARBELL: [String] = ["Barbell Squat", "Barbell Stiff-Leg Deadlift", "Standing Calf Raise"]
let LEG_BARBELL_ID: [String] = ["SW_C1A-rejs", "1uDiW5--rAE", "K_jsGgztcGU"]
let LEG_BAREHAND: [String] = ["Bulgarian Split Squat"]
let LEG_BAREHAND_ID: [String] = ["2C-uNgKwPLE"]
let LEG_CABLE: [String] = ["Hack Squat", "Leg Press", "Seated Calf Raise", "Leg Press Calf Raise", "Donkey Calf Raise"]
let LEG_CABLE_ID: [String] = ["0tn5K9NlCfo", "IZxyjW7MPJQ", "JbyjNymZOt0", "M4FojyRAcuE", "r30EoMPSNns"]

let CORE_DUMBBELL:[String] = []
let CORE_DUMBBELL_ID:[String] = []
let CORE_BARBELL: [String] = ["Barbell Russian Twist"]
let CORE_BARBELL_ID: [String] = ["M00ZuV7a9k8"]
let CORE_BAREHAND: [String] = ["Arms-High Partial Situp", "Swiss Ball Crunch", "Flutter Kick", "Leg Raise", "Pike to Superman", "Plank", "Side Plank", "Swiss Ball V-Up and Pass"]
let CORE_BAREHAND_ID: [String] = ["V4qhxtXLtaU", "Imui46JTe7s", "ANVdMDaYRts", "JB2oyawG9KI", "_bKAh994MWI", "pSHjTRCQxIw", "NXr4Fw8q60o", "Lrmlsxk3zx4"]
let CORE_CABLE: [String] = ["Ab Wheel Rollout", "Dip/Leg Raise Combo"]
let CORE_CABLE_ID: [String] = ["PwqJTPsI6i0", "UGjlo6FTQTs"]

let CARDIO_NAME:[String] = ["FULL BODY KICK", "INSANE CARDIO", "HIIT BURNER", "QUAD FLY"]

let FULL_BODY_KICK:[String] = ["Burpees", "Push ups", "Squat Jump 180", "Crunches", "Jumping Jacks"]

let FULL_BODY_REP:[String] = ["15","20","8","20","45s"]

let INSANE_CARDIO:[String] = ["Mountain Climbers", "Squat Jump", "Jumping Jacks", "Burpees", "Rope Jump"]
let INSANE_REP:[String] = ["45s", "15", "30s", "15", "20" ]

let HIIT_BURNER:[String] = ["High Knees", "Squat Jump 180", "Half Burpees", "Diamond Push ups", "Mountain Climbers"]
let HIIT_REP:[String] = ["30s", "15", "30s", "20", "40s"]

let QUAD_FLY:[String] = ["Squats", "Wall Sit", "Vertical Jumps", "Alternating Lunges"]
let QUAD_REP:[String] = ["30", "30s", "15", "20"]

let COLOR_NAVIGATIONBAR_BUTTON: UIColor = UIColor.init(hex: "0075FB", alpha: 1.0)
