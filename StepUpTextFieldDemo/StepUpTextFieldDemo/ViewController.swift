//
//  ViewController.swift
//  StepUpTextFieldDemo
//
//  Created by Hardik on 05/02/18.
//  Copyright © 2018 HB007. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtField1 : StepUpTextField!
    @IBOutlet weak var txtField2 : StepUpTextField!
    @IBOutlet weak var txtField3 : StepUpTextField!

    @IBOutlet weak var label1 : UILabel!
    @IBOutlet weak var label2 : UILabel!
    @IBOutlet weak var label3 : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = " StepSize : \(txtField1.stepSize) and maxValue : \(txtField1.maxValue)"
        label2.text = " StepSize : \(txtField2.stepSize) and maxValue : \(txtField2.maxValue)"
        label3.text = " StepSize : \(txtField3.stepSize) and maxValue : \(txtField3.maxValue)"
        
        txtField1.stepUpDelegate = self
        txtField2.stepUpDelegate = self
        txtField3.stepUpDelegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController : StepUpTextFieldDelegate
{
    func stepUpTextField(_ textField: StepUpTextField, didIncrementValue val: String) {
        print("Value has been incremented!")
    }
    
    func stepUpTextField(_ textField: StepUpTextField, didDecrementValue val: String) {
        print("Value has been decremented!")
    }
    
    
}


