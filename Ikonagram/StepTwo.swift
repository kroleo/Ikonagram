//
//  StepTwo.swift
//  Ikonagram
//
//  Created by Omar on 11/27/15.
//  Copyright © 2015 Kroleo. All rights reserved.
//

import UIKit

class StepTwo: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var edit: UITextField!
    
    @IBOutlet weak var message: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edit.delegate = self;
    }
   
    @IBAction func editor(sender: UITextField) {
        self.message.text = sender.text
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
   
    func textFieldDidBeginEditing(textField: UITextField) {
        scrollview.setContentOffset(CGPointMake(0, 200), animated: true)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        scrollview.setContentOffset(CGPointMake(0, 0), animated: true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
