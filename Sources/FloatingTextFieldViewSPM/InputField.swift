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
    case password
}

public class InputField : UIView {
    @IBOutlet public var errorlabel: UILabel!
    @IBOutlet public var FloatingTextFieldheight: NSLayoutConstraint!
    @IBOutlet public var contentView: UIView!
    @IBOutlet public var passwordVisiblityButton: UIButton!
    @IBOutlet public var FloatingTextField: UITextField!
    
    @IBOutlet public var FloatingPlaceholderLabel: UILabel!
    
   var FieldType : FieldType!
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
            guard let Nib = Bundle.module.loadNibNamed("InputField", owner: self, options: nil)?[0] as? UIView
            else {
                print("error in load nib !!!")
                return
            }
            Nib.frame = self.bounds
            Nib.backgroundColor = .red
            setup()
            addSubview(Nib)

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
        passwordVisiblityButton.setTitle("", for: .normal)

        
    }
    
    public func selectField(type: FieldType){
        if type == .normal {
            print("----> normal field")
            FloatingTextField.keyboardType = .default
        }
        else if type == .URL {
            print("----> URL field")
            FloatingTextField.keyboardType = .URL
            
        }
        else if type == .email {
            print("----> email field")
            FloatingTextField.keyboardType = .emailAddress
           
        }
        else if type == .numberPad {
            print("----> numberpad field")
            FloatingTextField.keyboardType = .numberPad
        }
        else if type == .number{
            print("----> number field")
            FloatingTextField.keyboardType = .numbersAndPunctuation
        }
        else if type == .password{
            print("----> password field")
            FloatingTextField.isSecureTextEntry = true
            passwordVisiblityButton.isHidden = false
        }
        FloatingTextField.autocorrectionType = .no
        FloatingTextField.autocapitalizationType = .none
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
            FloatingPlaceholderLabel.textColor = UIColor.darkGray
            contentView.layer.borderColor = UIColor.gray.cgColor
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
