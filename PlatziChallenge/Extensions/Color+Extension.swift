//
//  Color+Extension.swift
//  PlatziChallenge
//
//  Created by Miguel Aquino on 19/12/20.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let mainBlue = UIColor.rgb(red: 0, green: 150, blue: 255)
    static let lightBlue = UIColor.rgb(red: 220, green: 233, blue: 255)
    static let lightRed = UIColor.rgb(red: 255, green: 200, blue: 200)
    static let lightGreen = UIColor.rgb(red: 200, green: 255, blue: 200)
    static let lightOrange = UIColor.rgb(red: 255, green: 220, blue: 205)
    static let lightPurple = UIColor.rgb(red: 220, green: 220, blue: 255)
    static let lightTeal = UIColor.rgb(red: 185, green: 230, blue: 230)
}
