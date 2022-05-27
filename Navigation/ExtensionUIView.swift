//
//  ExtensionUIView.swift
//  Navigation
//
//  Created by Елена Земляк on 22.05.2022.
//

import Foundation
import UIKit
extension UIImage {

    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}
 

