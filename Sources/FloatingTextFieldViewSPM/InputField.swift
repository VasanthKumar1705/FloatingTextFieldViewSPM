//
//  customTextField.swift
//  InvalidPassword
//
//  Created by vasanth on 28/10/21.
//

import Foundation
import UIKit

public enum FieldType {
    case none
    case numberPad
    case email
    case url
    case numberAndPuntuation
    case password
}

public struct InputFieldSetUp {
    var fieldtype:FieldType
    var errorText :String
    var errorTextColor:UIColor
    var placeHolderText : String
    var floatLabelTextColor:UIColor
    var floatLabelFont:UIFont
    var textFieldTextColor:UIColor
    var textFieldFont:UIFont
    
  public init(fieldtype:FieldType , errorText :String , errorTextColor:UIColor ,placeHolderText : String , floatLabelTextColor:UIColor,floatLabelFont:UIFont,textFieldTextColor:UIColor,textFieldFont:UIFont){
        self.fieldtype = fieldtype
        self.errorText = errorText
        self.errorTextColor = errorTextColor
        self.placeHolderText = placeHolderText
        self.floatLabelTextColor = floatLabelTextColor
        self.floatLabelFont = floatLabelFont
        self.textFieldTextColor = textFieldTextColor
        self.textFieldFont = textFieldFont
    }
}
public class InputField :UIView {
    
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
   
//    public func setUp(fieldtype:FieldType , errorText :String , errorTextColor:UIColor ,placeHolderText : String , floatLabelTextColor:UIColor,floatLabelFont:UIFont,textFieldTextColor:UIColor,textFieldFont:UIFont) {
    func setUp(inputFieldSetup:InputFieldSetUp) {
        
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
        switch(inputFieldSetup.fieldtype){
        case .url :
            floatingTextField.keyboardType = .URL
        case .numberPad:
            floatingTextField.keyboardType = .numberPad
        case .email:
            floatingTextField.keyboardType = .emailAddress
        case .numberAndPuntuation:
            floatingTextField.keyboardType = .numbersAndPunctuation
        case .password:
            floatingTextField.isSecureTextEntry = true
            passwordVisiblityButton.isHidden = false
        case .none:
            floatingTextField.keyboardType = .default
        floatingTextField.autocorrectionType = .no
        floatingTextField.autocapitalizationType = .none
        }
        errorLabel.text = inputFieldSetup.errorText
        errorLabel.textColor = inputFieldSetup.errorTextColor
        floatingTextField.placeholder = inputFieldSetup.placeHolderText
        floatingPlaceholderLabel.text = inputFieldSetup.placeHolderText
        floatingPlaceholderLabel.textColor = inputFieldSetup.floatLabelTextColor
        floatingPlaceholderLabel.font = inputFieldSetup.floatLabelFont
        floatingTextField.textColor = inputFieldSetup.textFieldTextColor
        floatingTextField.font = inputFieldSetup.textFieldFont
    }
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
