//
//  File.swift
//  
//
//  Created by vasanth on 18/11/21.
//

import Foundation
import UIKit

extension UIFont {
    
    static func registerLatoFonts() {
        let fontNames = ["Lato-Regular", "Lato-Medium", "Lato-Bold", "Lato-Semibold"]
        fontNames.forEach {
            if let fontLocation = Bundle.module.url(forResource: $0, withExtension: "ttf") {
                registerFont(from: fontLocation)
            }
        }
    }
        
    static func registerFont(from location: URL) {
        guard let fontDataProvider = CGDataProvider(url: location as CFURL) else {
            return
        }
        guard let font = CGFont(fontDataProvider) else {
            return
        }
        var error: Unmanaged<CFError>?
        guard CTFontManagerRegisterGraphicsFont(font, &error) else {
            return
        }
    }
}

extension UIFont {
    
    static var latoRegular12: UIFont? {
        return UIFont(name: "Lato-Regular", size: 12)
    }
    
    static var latoRegular16: UIFont? {
        return UIFont(name: "Lato-Regular", size: 16)
    }
    
    static var latoSemibold16: UIFont? {
        return UIFont(name: "Lato-Semibold", size: 16)
    }
    
    static var latoBold12: UIFont? {
        return UIFont(name: "Lato-Bold", size: 12)
    }
    
    static var latoBold16: UIFont? {
        return UIFont(name: "Lato-Bold", size: 16)
    }
    
    static var latoBold24: UIFont? {
        return UIFont(name: "Lato-Bold", size: 24)
    }
}
