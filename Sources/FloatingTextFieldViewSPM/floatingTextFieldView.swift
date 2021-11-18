//
//  customTextField.swift
//  InvalidPassword
//
//  Created by vasanth on 28/10/21.
//

import Foundation
import UIKit

public class floatingTextFieldView : UIView {
    @IBOutlet public var errorlabel: UILabel!
    @IBOutlet public var FloatingTextFieldheight: NSLayoutConstraint!
    @IBOutlet public var contentView: UIView!
    @IBOutlet public var passwordVisiblityButton: UIButton!
    @IBOutlet public var FloatingTextField: UITextField!
    
    @IBOutlet public var FloatingPlaceholderLabel: UILabel!
    
   
   public override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
    
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
 
        func commonInit() {
            // standard initialization logic
            let nib = Bundle.module.loadNibNamed("floatingTextFieldView", owner: self, options: nil)![0] as! UIView
            nib.frame = self.bounds
            nib.backgroundColor = .clear
            setup()
            addSubview(nib)

        }
    
    func setup() {
        let borderColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1).cgColor
        contentView.layer.borderColor = borderColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        FloatingTextFieldheight.constant = 50
        FloatingTextField.autocorrectionType = .no
        passwordVisiblityButton.isHidden = true
        errorlabel.isHidden = true
        
    }
    
  
  
   public func showFloatinglabel(){
        FloatingTextFieldheight.constant = 33
        FloatingTextField.attributedPlaceholder = NSAttributedString(
            string: FloatingPlaceholderLabel.text!,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
    }
  
    
   public func validation(){
        if FloatingTextField.text == "" {
            print("Password is empty")
            FloatingPlaceholderLabel.textColor = .red
            FloatingTextField.attributedPlaceholder = NSAttributedString(
                string: FloatingPlaceholderLabel.text!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
            )
            contentView.layer.borderColor = UIColor.red.cgColor
            errorlabel.isHidden = false
        } else {
            print("Password is filled")
            FloatingPlaceholderLabel.textColor = .black
            contentView.layer.borderColor = UIColor.black.cgColor
            errorlabel.isHidden = true
        }
        FloatingTextFieldheight.constant = 33
    }
    
   public func successValidation(){
        print("Password is empty")
        FloatingPlaceholderLabel.textColor = .red
        FloatingTextField.attributedPlaceholder = NSAttributedString(
            string: FloatingPlaceholderLabel.text!,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        contentView.layer.borderColor = UIColor.red.cgColor
        errorlabel.isHidden = false
        FloatingTextFieldheight.constant = 33
    }
  public  func failureValidation() {
        print("Password is filled")
        FloatingPlaceholderLabel.textColor = .black
        contentView.layer.borderColor = UIColor.black.cgColor
        errorlabel.isHidden = true
        FloatingTextFieldheight.constant = 33
    }
   public func clearAll(){
        FloatingTextField.text = ""
        FloatingTextFieldheight.constant = 50
        FloatingTextField.attributedPlaceholder = NSAttributedString(
            string: FloatingPlaceholderLabel.text!,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        errorlabel.isHidden = true
        FloatingPlaceholderLabel.textColor = .black
        contentView.layer.borderColor = UIColor.gray.cgColor
    }
    
    
}
