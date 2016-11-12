//
//  ViewController.swift
//  SampleApp
//
//  Created by Asar, Chandra on 11/7/16.
//  Copyright © 2016 Asar, Chandra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //appropriate to use ! here because it's a ui element so it had better be there
    //UI elements
    @IBOutlet var lowerBoundField: UITextField!
    @IBOutlet var upperBoundField: UITextField!
    //@IBOutlet var generateNumberButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
    //other helper variables
    var stringOfRandomNumber: String = "0";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //NOTE: what does delegate = self mean? xD
        lowerBoundField.delegate = self;
        lowerBoundField.keyboardType = .numberPad;
        
        upperBoundField.delegate = self;
        upperBoundField.keyboardType = .numberPad;
        
        //defaulting to 0 and 100 to help prevent non-numbers coming in through text fields
        lowerBoundField.text = "0";
        upperBoundField.text = "100";
        
        //default text
        resultLabel.text = ":D";
        
        //disabling until text fields are valid as numbers only; NOTE: maybe don't need if text field keypad type is number only
        //generateNumberButton.isEnabled = false;
    }
    
    @IBAction func clickBtnToGenerateRandomNumber(){
        //calls func to calculate random number
        //figured that sending text fields to private function would be better for security or clean code. Am I thinking about that right?
        //NOTE: wouldn't let me use "and" to separate
        resultLabel.text = calculateRandomNumber(upperStr: upperBoundField.text!, lowerStr: lowerBoundField.text!);
        
        //calls function to display random number in label ui el
        //displayRandomlyGeneratedNumber();
    }
    
    //figure out good syntax to accept arguments of two bounds
    private func calculateRandomNumber(upperStr: String, lowerStr: String) -> String {
        //code for calculating random number in swift goes here, and is returned
        let upperNum = UInt32(upperStr);
        let lowerNum = UInt32(lowerStr);
        
        let randomNum = arc4random_uniform(upperNum!) + lowerNum! // [1, 100]
        
        let randomStrOfNum = String(randomNum);
        
        return randomStrOfNum;
    }
    
    //write function here to display random number in app here, unless I need to do it in same func? That wouldn't make sense, tho
    func displayRandomlyGeneratedNumber(){
        //this function might be totes unnecessary - remove if it looks unnecessary later :D
        //static test before wiring up
        resultLabel.text = stringOfRandomNumber;
    }
    
    
    
    //logic and ui tasks to do:
    //---DONE?: write function for user type events - specify number only or constrain to number only in text fields
    //write function for user click btn event
        //this will get min and max vals from input fields for random function
    
    //write function to bind displayed number to what's returned from btn click function event
    //??????---------I created two side by side labels, so one could only display number field. Would it be better to have results: # all in same label somehow? ASK ERIC--------??????
    
    
    //??????-----ASK ERIC ABOUT WHETHER THAT BOTTOM BTN BAR IS PART OF ASSIGNMENT------??????

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

