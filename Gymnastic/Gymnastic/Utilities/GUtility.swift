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
    
    class func alertToUser(_ msg:String, _ vc:UIViewController){
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Got it", style: .cancel, handler: nil)
        alert.addAction(okButton)
        vc.present(alert, animated: true, completion: nil)
    }
}
