//
//  customTextField.swift
//  InvalidPassword
//
//  Created by vasanth on 28/10/21.
//

import Foundation
import UIKit

public enum fieldType {
    case Default
    case NumberPad
    case Email
    case URL
    case NumberAndPuntuation
    case Password
}

public class InputField : UIView {
    
    @IBOutlet var floatingPlaceholderLabel: UILabel!
    @IBOutlet var floatingTextField: UITextField!
    @IBOutlet var contentView: UIView!
    @IBOutlet var passwordVisiblityButton: UIButton!
    @IBOutlet var inputFieldHeight: NSLayoutConstraint!
    @IBOutlet var errorLabel: UILabel!
    
   
        public override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
    
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
    
 
 
        func commonInit() {
            guard let Nib = Bundle.module.loadNibNamed("InputField", owner: self, options: nil)?[0] as? UIView
            else {
                print("error in load nib !!!")
                return
            }
            Nib.frame = self.bounds
            Nib.backgroundColor = .clear
            addSubview(Nib)
        }
   
   public func setUp(fieldtype:fieldType) {
        contentView.backgroundColor = .white
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        inputFieldHeight.constant = 45
        errorLabel.isHidden = true
        floatingTextField.attributedPlaceholder = NSAttributedString(
            string: floatingTextField.placeholder ?? "placehoder",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.gray,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)
            ]
        )
        floatingTextField.textColor = UIColor.gray
        floatingTextField.font =  UIFont.systemFont(ofSize: 16)
        floatingTextField.autocorrectionType = .no
        floatingPlaceholderLabel.font =  UIFont.systemFont(ofSize: 12)
        floatingPlaceholderLabel.textColor = UIColor.darkGray
        floatingPlaceholderLabel.isHidden = true
        passwordVisiblityButton.setTitle("", for: .normal)
        passwordVisiblityButton.isHidden = true
        switch(fieldtype){
        case .URL :
            floatingTextField.keyboardType = .URL
        case .NumberPad:
            floatingTextField.keyboardType = .numberPad
        case .Email:
            floatingTextField.keyboardType = .emailAddress
        case .NumberAndPuntuation:
            floatingTextField.keyboardType = .numbersAndPunctuation
        case .Password:
            floatingTextField.isSecureTextEntry = true
            passwordVisiblityButton.isHidden = false
        case .Default:
            floatingTextField.keyboardType = .default
        floatingTextField.autocorrectionType = .no
        floatingTextField.autocapitalizationType = .none
        case .none:
            print("none")
        }
    }
    
//    public func selectField(type: fieldType){
//        switch(type){
//        case .URL :
//            floatingTextField.keyboardType = .URL
//        case .NumberPad:
//            floatingTextField.keyboardType = .numberPad
//        case .Email:
//            floatingTextField.keyboardType = .emailAddress
//        case .NumberAndPuntuation:
//            floatingTextField.keyboardType = .numbersAndPunctuation
//        case .Password:
//            floatingTextField.isSecureTextEntry = true
//            passwordVisiblityButton.isHidden = false
//        case .Default:
//            floatingTextField.keyboardType = .default
//        }
//        floatingTextField.autocorrectionType = .no
//        floatingTextField.autocapitalizationType = .none
//    }
  
   public func showFloatinglabel(){
        inputFieldHeight.constant = 24
        floatingTextField.attributedPlaceholder = NSAttributedString(
            string: floatingPlaceholderLabel.text!,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
    }
  
   public func validation(){
        if floatingTextField.text == "" {
            print("Password is empty")
            floatingPlaceholderLabel.textColor = .red
            floatingTextField.attributedPlaceholder = NSAttributedString(
                string: floatingPlaceholderLabel.text!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
            )
            contentView.layer.borderColor = UIColor.red.cgColor
            errorLabel.isHidden = false
        } else {
            print("Password is filled")
            floatingPlaceholderLabel.textColor = UIColor.darkGray
            contentView.layer.borderColor = UIColor.gray.cgColor
            errorLabel.isHidden = true
        }
       floatingPlaceholderLabel.isHidden = false
       inputFieldHeight.constant = 24
    }
    
   public func successValidation(){
        print("Password is empty")
        floatingPlaceholderLabel.textColor = .red
        floatingTextField.attributedPlaceholder = NSAttributedString(
            string: floatingPlaceholderLabel.text!,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        contentView.layer.borderColor = UIColor.red.cgColor
        errorLabel.isHidden = false
        inputFieldHeight.constant = 24
    }
  public  func failureValidation() {
        print("Password is filled")
        floatingPlaceholderLabel.textColor = .black
        contentView.layer.borderColor = UIColor.black.cgColor
        errorLabel.isHidden = true
        inputFieldHeight.constant = 24
    }
   public func clearAll(){
        floatingTextField.text = ""
        inputFieldHeight.constant = 45
        floatingTextField.attributedPlaceholder = NSAttributedString(
            string: floatingPlaceholderLabel.text!,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        errorLabel.isHidden = true
        floatingPlaceholderLabel.textColor = .black
        contentView.layer.borderColor = UIColor.gray.cgColor
    }
    
    @IBAction func PasswordVisiblityButtonTapped(_ sender: Any) {
        floatingTextField.isSecureTextEntry.toggle()
    }
    
}
