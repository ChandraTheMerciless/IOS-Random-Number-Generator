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
    @IBOutlet var lowerBoundField: UITextField!
    @IBOutlet var upperBoundField: UITextField!
    //@IBOutlet var generateNumberButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
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
        
        
        //disabling until text fields are valid as numbers only; NOTE: maybe don't need if text field keypad type is number only
        //generateNumberButton.isEnabled = false;
    }
    
    @IBAction func clickBtnToGenerateRandomNumber(){
        
        //call calculateRandomNumber() and send upper and lower bound numbers to it. Returns random number
        
        //call function to display random number in app here
    }
    
    //figure out good syntax to accept arguments of two bounds
    func calculateRandomNumber(){
        //code for calculating random number in swift goes here, and is returned
    }
    
    //write function here to display random number in app here
    
    
    
    
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

