//
//  GBaseDialog.swift
//  Gymnastic
//
//  Created by Squall on 9/11/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import Foundation
import UIKit

class GBaseDialog: UIViewController {
    var mainContentView: UIView?
    var dismissCompletion: (()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showDialog(completion:(() -> Void)?) {
        self.view.frame = UIScreen.main.bounds
        GDelegate.tabBarController.addChildViewController(self)
        GDelegate.window?.addSubview(self.view)
        
        mainContentView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 1.0)
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
            self.mainContentView?.layer.opacity = 1.0
            self.mainContentView?.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }) { (finish) in
            if completion != nil {
                completion!()
            }
        }
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.mainContentView?.transform = (self.mainContentView?.transform)!.scaledBy(x: 0.7,y: 0.7)
            self.mainContentView?.alpha = 0.0
            self.view.alpha = 0.0
        }) { (finish) in
            self.willMove(toParentViewController: nil)
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
            if self.dismissCompletion != nil {
                self.dismissCompletion!()
            }
        }
    }
}
