//
//  File.swift
//  
//
//  Created by vasanth on 18/11/21.
//

import Foundation
import UIKit

extension UIColor {
    static var shadowColor: CGColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
    }
    
    static var borderColor: CGColor {
        return UIColor(red: 0.941, green: 0.941, blue: 0.941, alpha: 1).cgColor
    }
    
    static var borderColor2: CGColor {
        return UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1).cgColor
    }
    
    static var grey600: UIColor {
        return UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
    }
    
    static var grey700: UIColor {
        return UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
    }
    
    static var grey800: UIColor {
        return UIColor(red: 20/255, green: 20/255, blue: 20/255, alpha: 1)
    }
    
    static var blue500: UIColor {
        return UIColor(red: 29/255, green: 144/255, blue: 245/255, alpha: 1)
    }
    
    static var blue300: UIColor {
        return UIColor(red: 149/255, green: 209/255, blue: 249/255, alpha: 1)
    }
    
    static var callToActionBlueColor: UIColor {
        return UIColor(red: 0.114, green: 0.565, blue: 0.961, alpha: 1)
    }
    
    static var titleColor: UIColor {
        return UIColor(red: 0.094, green: 0.094, blue: 0.094, alpha: 1)
    }
}
