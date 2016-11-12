//
//  ViewController.swift
//  SampleApp
//
//  Created by Asar, Chandra on 11/7/16.
//  Copyright © 2016 Asar, Chandra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //appropriate to use ! here because it's a ui element so it had better be there
    @IBOutlet var lowerBoundField: UITextField!
    @IBOutlet var upperBoundField: UITextField!
    @IBOutlet var generateNumberButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lowerBoundField.text = "Hello";
        upperBoundField.text = "World";
        
        resultLabel.text = "42";
        
    }
    
    //logic and ui tasks to do:
    //write function for user type events - specify number only or constrain to number only in text fields
    //write function for user click btn event
        //this will get min and max vals from input fields for random function
    
    //build large test display for generated number
        //write function to bind displayed number to what's returned from btn click function event
        //??????---------I created two side by side labels, so one could only display number field. Would it be better to have results: # all in same label somehow? ASK ERIC--------??????
    
    
    //??????-----ASK ERIC ABOUT WHETHER THAT BOTTOM BTN BAR IS PART OF ASSIGNMENT------??????

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

