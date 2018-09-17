//
//  GUtility.swift
//  Gymnastic
//
//  Created by Squall on 9/14/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import Foundation
import UIKit

class GUtility: NSObject{
    class func createNavigationTextButton(_ direction:String, _ text:String, _ color:String){
        let iconButton:UIBarButtonItem = UIBarButtonItem(title: text, style: .plain, target: self, action: #selector(baseFunction))
        iconButton.tintColor = UIColor(hex: color)
        if direction == "right" {
            
        }
    }
    
    class func createNavigationIconButton(_ direction:String, _ image:String, _ color:String){
    
    }
    
    @objc func baseFunction(){
        //let override it
        print("base function")
    }
}
