//
//  StepUpTextField.swift
//  Cheep
//
//  Created by Hardik on 23/12/17.
//  Copyright © 2017 Openxcell. All rights reserved.
//

import UIKit

@objc protocol StepUpTextFieldDelegate : UITextFieldDelegate {
    
    func stepUpTextField(textField : StepUpTextField, didIncrementValue val : String)
    
    func stepUpTextField(textField : StepUpTextField, didDecrementValue val : String)
}

@IBDesignable
class StepUpTextField: UITextField, UITextFieldDelegate {
    
    @IBInspectable
    var maxValue : UInt = 5
    @IBInspectable
    var minValue : UInt = 0
    @IBInspectable
    var maxDigits : UInt = 2
    @IBInspectable
    var stepSize : Int = 2
    
    var stepUpDelegate: StepUpTextFieldDelegate?
    
    override func draw(_ rect: CGRect) {
        self.delegate = self
        self.keyboardType = .numberPad
        if self.text!.isEmpty
        {
            self.text = "\(self.minValue)"
        }
        self.textAlignment = .center

        addButtons()
    }
    
    //MARK: - Text Field Delegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // only allow numerical characters
        guard string.characters.flatMap({ Int(String($0)) }).count ==
            string.characters.count else { return false }
        
        let text = textField.text ?? ""
        
        if string.characters.count == 0 {
            textField.text = String(text.characters.dropLast()).chunkFormatted(withChunkSize: Int(maxDigits))
        }
        else {
            let newText = String((text + string).characters
                .filter({ $0 != " " }).prefix(2))
            textField.text = newText.chunkFormatted(withChunkSize: Int(maxDigits))
        }
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text!.isEmpty
        {
            textField.text = "\(minValue)"
        }
    }
    
    // MARK: - Adding Buttons

    func addButtons()
    {
        //Plus Button
        let rightView = UIButton()
        rightView.setImage(#imageLiteral(resourceName: "btnPlus"), for: .normal)
        rightView.frame = CGRect(x: 0, y: (self.frame.height - 17)/2, width: 17, height: 17)
        rightView.addTarget(self, action: #selector(self.btnPlusClicked), for: .touchUpInside)
        self.rightView = rightView
        self.rightViewMode = .always
        
        //Minus Button
        let leftView = UIButton()
        leftView.setImage(#imageLiteral(resourceName: "btnMinus"), for: .normal)
        leftView.frame = CGRect(x: 0, y: (self.frame.height - 17)/2 , width: 17, height: 17)
        leftView.addTarget(self, action: #selector(self.btnMinusClicked), for: .touchUpInside)
        self.leftView = leftView
        self.leftViewMode = .always
        
    }
    
    @objc func btnPlusClicked()
    {
        if let num = Int(self.text!) as? Int
        {
            //Max 2 characters
            if (num + stepSize) <= maxValue
            {
                self.text = "\(num + stepSize)"
                self.stepUpDelegate?.stepUpTextField(textField: self, didIncrementValue: self.text!)
            }
        }
    }
    
    @objc func btnMinusClicked()
    {
        if let num = Int(self.text!) as? Int
        {
            if (num - stepSize) >= minValue
            {
                self.text = "\(num - stepSize)"
                self.stepUpDelegate?.stepUpTextField(textField: self, didDecrementValue: self.text!)
            }
        }
    }
}
