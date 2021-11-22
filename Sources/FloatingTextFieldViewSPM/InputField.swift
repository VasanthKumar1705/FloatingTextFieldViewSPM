//
//  customTextField.swift
//  InvalidPassword
//
//  Created by vasanth on 28/10/21.
//

import Foundation
import UIKit

public enum FieldType {
    case Default
    case NumberPad
    case Email
    case URL
    case NumberAndPuntuation
    case Password
}

public class InputField : UIView {
    
    @IBOutlet public var ErrorLabel: UILabel!
    @IBOutlet var InputFieldHeight: NSLayoutConstraint!
    @IBOutlet var ContentView: UIView!
    @IBOutlet public var PasswordVisiblityButton: UIButton!
    @IBOutlet public var FloatingTextField: UITextField!
    @IBOutlet public var FloatingPlaceholderLabel: UILabel!
    
   
    var checked : Bool = true
        public override init(frame: CGRect) {
            super.init(frame: frame)
            CommonInit()
        }
    
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            CommonInit()
        }
 
        func CommonInit() {
            guard let Nib = Bundle.module.loadNibNamed("InputField", owner: self, options: nil)?[0] as? UIView
            else {
                print("error in load nib !!!")
                return
            }
            Nib.frame = self.bounds
            Nib.backgroundColor = .clear
            SetUp()
            addSubview(Nib)
        }
   
    func SetUp() {
        ContentView.backgroundColor = .white
        ContentView.layer.borderColor = UIColor.gray.cgColor
        ContentView.layer.borderWidth = 1
        ContentView.layer.cornerRadius = 12
        ContentView.layer.masksToBounds = true
        InputFieldHeight.constant = 45
        ErrorLabel.isHidden = true
        FloatingTextField.attributedPlaceholder = NSAttributedString(
            string: FloatingTextField.placeholder ?? "placehoder",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.gray,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)
            ]
        )
        FloatingTextField.textColor = UIColor.gray
        FloatingTextField.font =  UIFont.systemFont(ofSize: 16)
        FloatingTextField.autocorrectionType = .no
        FloatingPlaceholderLabel.font =  UIFont.systemFont(ofSize: 12)
        FloatingPlaceholderLabel.textColor = UIColor.darkGray
        FloatingPlaceholderLabel.isHidden = true
        PasswordVisiblityButton.setTitle("", for: .normal)
        PasswordVisiblityButton.isHidden = true
    }
    
    public func selectField(type: FieldType){
        switch(type){
        case .URL :
            FloatingTextField.keyboardType = .URL
        case .NumberPad:
            FloatingTextField.keyboardType = .numberPad
        case .Email:
            FloatingTextField.keyboardType = .emailAddress
        case .NumberAndPuntuation:
            FloatingTextField.keyboardType = .numbersAndPunctuation
        case .Password:
            FloatingTextField.isSecureTextEntry = true
            PasswordVisiblityButton.isHidden = false
        case .Default:
            FloatingTextField.keyboardType = .default
        }
        FloatingTextField.autocorrectionType = .no
        FloatingTextField.autocapitalizationType = .none
    }
  
   public func showFloatinglabel(){
        InputFieldHeight.constant = 24
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
            ContentView.layer.borderColor = UIColor.red.cgColor
            ErrorLabel.isHidden = false
        } else {
            print("Password is filled")
            FloatingPlaceholderLabel.textColor = UIColor.darkGray
            ContentView.layer.borderColor = UIColor.gray.cgColor
            ErrorLabel.isHidden = true
        }
       FloatingPlaceholderLabel.isHidden = false
       InputFieldHeight.constant = 24
    }
    
   public func successValidation(){
        print("Password is empty")
        FloatingPlaceholderLabel.textColor = .red
        FloatingTextField.attributedPlaceholder = NSAttributedString(
            string: FloatingPlaceholderLabel.text!,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        ContentView.layer.borderColor = UIColor.red.cgColor
        ErrorLabel.isHidden = false
        InputFieldHeight.constant = 24
    }
  public  func failureValidation() {
        print("Password is filled")
        FloatingPlaceholderLabel.textColor = .black
        ContentView.layer.borderColor = UIColor.black.cgColor
        ErrorLabel.isHidden = true
        InputFieldHeight.constant = 24
    }
   public func clearAll(){
        FloatingTextField.text = ""
        InputFieldHeight.constant = 45
        FloatingTextField.attributedPlaceholder = NSAttributedString(
            string: FloatingPlaceholderLabel.text!,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        ErrorLabel.isHidden = true
        FloatingPlaceholderLabel.textColor = .black
        ContentView.layer.borderColor = UIColor.gray.cgColor
    }
    
    @IBAction func PasswordVisiblityButtonTapped(_ sender: Any) {
        FloatingTextField.isSecureTextEntry.toggle()
    }
    
}
