//
//  ExtensionUIViewController.swift
//  Navigation
//
//  Created by Елена Земляк on 17.05.2022.
//

import Foundation
import UIKit



public extension UIViewController {

    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */

   var topbarHeight: CGFloat {
        
        return ((view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                ((self.navigationController?.navigationBar.isHidden == true) ? 0 : self.navigationController?.navigationBar.frame.height ?? 0.0))
    }
    
    var tabbarHeight: CGFloat {
        
        return self.navigationController?.tabBarController?.tabBar.frame.height ?? 0.0
    }
    
    var viewWidht: Int {
        
        return Int(view.frame.width)
                  
    }
    
}
