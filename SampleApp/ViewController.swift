//
//  ViewController.swift
//  SampleApp
//
//  Created by Asar, Chandra on 11/7/16.
//  Copyright © 2016 Asar, Chandra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //appropriate to use ! here because these are UI element so it had better be there
    @IBOutlet var lowerBoundField: UITextField!
    @IBOutlet var upperBoundField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ADDITIONAL SETUP AFTER VIEW LOADS - after this, there's another lifecycle func for viewDidAppear()
        
        //assign delegates
        lowerBoundField.delegate = self;
        upperBoundField.delegate = self;
        
        //force keyboard type of numberPad
        lowerBoundField.keyboardType = .numberPad;
        upperBoundField.keyboardType = .numberPad;
        
        //defaulting lower and upper bounds to 0 and 100
        lowerBoundField.text = "0";
        upperBoundField.text = "100";
        
        //default text
        resultLabel.text = "Result: ";
    }
    
    //this dismisses the keyboard when user clicks outside of a text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true);
        super.touchesBegan(touches, with: event);
        
        lowerBoundField.resignFirstResponder();
        upperBoundField.resignFirstResponder();
    }

    @IBAction func clickBtnToGenerateRandomNumber(){
        //calls func to calculate random number, and returned value populates result label
        resultLabel.text = "Result: " + calculateRandomNumber(upperStr: upperBoundField.text!, lowerStr: lowerBoundField.text!);
    }
    
    private func calculateRandomNumber(upperStr: String, lowerStr: String) -> String {
        //convert string from textfields to Int types that work with native random number generator function
        let upperNum = UInt32(upperStr);
        let lowerNum = UInt32(lowerStr);
        
        //arc4random is random number generator function
        let randomNum = lowerNum! + arc4random_uniform(upperNum! - lowerNum! + 1);
        
        //convert result of rndomly generated number back to string
        let randomStrOfNum = String(randomNum);
        
        return randomStrOfNum;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.s
    }
}

