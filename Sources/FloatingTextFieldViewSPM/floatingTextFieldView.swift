//
//  customTextField.swift
//  InvalidPassword
//
//  Created by vasanth on 28/10/21.
//

import Foundation
import UIKit

public enum FieldType {
    case normal
    case numberPad
    case email
    case URL
    case number
}

public class floatingTextFieldView : UIView {
    @IBOutlet public var errorlabel: UILabel!
    @IBOutlet public var FloatingTextFieldheight: NSLayoutConstraint!
    @IBOutlet public var contentView: UIView!
    @IBOutlet public var passwordVisiblityButton: UIButton!
    @IBOutlet public var FloatingTextField: UITextField!
    
    @IBOutlet public var FloatingPlaceholderLabel: UILabel!
    
    public var FieldType : FieldType!
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
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        FloatingTextFieldheight.constant = 45
        FloatingTextField.autocorrectionType = .no
        passwordVisiblityButton.isHidden = true
        errorlabel.isHidden = true
        FloatingTextField.attributedPlaceholder = NSAttributedString(
            string: FloatingTextField.placeholder ?? "placehoder",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.gray,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)
            ]
        )
        FloatingPlaceholderLabel.font =  UIFont.systemFont(ofSize: 12)
        FloatingPlaceholderLabel.textColor = UIColor.darkGray
        FloatingTextField.textColor = UIColor.gray
        FloatingTextField.font =  UIFont.systemFont(ofSize: 16)
        FloatingPlaceholderLabel.isHidden = true
        
        
    }
    
    public func selectField(type: FieldType){
        if type == .normal {
            print("----> normal field")
            
        }
        else if type == .URL {
            print("----> URL field")
        }
        else if type == .email {
            print("----> email field")
        }
        else if type == .numberPad {
            print("----> numberpad field")
            FloatingTextField.keyboardType = .numberPad
        }
        else if type == .number{
            print("----> number field")
        }
    }
  
   public func showFloatinglabel(){
        FloatingTextFieldheight.constant = 24
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
       FloatingPlaceholderLabel.isHidden = false
        FloatingTextFieldheight.constant = 24
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
        FloatingTextFieldheight.constant = 24
    }
  public  func failureValidation() {
        print("Password is filled")
        FloatingPlaceholderLabel.textColor = .black
        contentView.layer.borderColor = UIColor.black.cgColor
        errorlabel.isHidden = true
        FloatingTextFieldheight.constant = 24
    }
   public func clearAll(){
        FloatingTextField.text = ""
        FloatingTextFieldheight.constant = 45
        FloatingTextField.attributedPlaceholder = NSAttributedString(
            string: FloatingPlaceholderLabel.text!,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        errorlabel.isHidden = true
        FloatingPlaceholderLabel.textColor = .black
        contentView.layer.borderColor = UIColor.gray.cgColor
    }
    
    
}
