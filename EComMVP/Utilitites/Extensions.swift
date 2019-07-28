//
//  Extensions.swift
//  EComMVP
//
//  Created by Rajagopal Ganesan on 13/07/19.
//  Copyright © 2019 Rajagopal Ganesan. All rights reserved.
//

import UIKit


extension UIColor {
    
    static var RANDOM: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
    
    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}

extension UIFont {
    class func appRegularFont(with size:CGFloat) -> UIFont {
        return UIFont(name:"HelveticaNeue-Bold", size: size)!
    }
    
    class func appMediumFont(with size:CGFloat) -> UIFont {
        return UIFont(name:"HelveticaNeue-Bold", size: size)!
    }
    
    class func appBoldFont(with size:CGFloat) -> UIFont {
        return UIFont(name:"HelveticaNeue-Bold", size: size)!
    }
}
