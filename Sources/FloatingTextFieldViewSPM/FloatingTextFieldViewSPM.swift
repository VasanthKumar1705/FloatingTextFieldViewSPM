import UIKit
public struct FloatingTextFieldViewSPM {
    public private(set) var text = "Hello, World!"

    public init() {
    }
    
    public func callNib() {
        print("successfully call the nib...")
        
    }
    
    public lazy var floatTextField : UIView = {
        let view = floatingTextFieldView()
        return view
    }()
}
