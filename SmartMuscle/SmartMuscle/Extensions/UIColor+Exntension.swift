//
//  UIColor+Exntension.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 22/05/23.
//

import UIKit

extension UIColor {
    static func rgb(red:CGFloat, green:CGFloat, blue:CGFloat) -> UIColor {
       return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }

    static let darkBackground = rgb(red: 28, green: 28, blue: 30)
    static let darkUpgrateToPro = rgb(red: 44, green: 44, blue: 46)
    
    
    static let goldBackground = rgb(red: 210, green: 172, blue: 31)
}
