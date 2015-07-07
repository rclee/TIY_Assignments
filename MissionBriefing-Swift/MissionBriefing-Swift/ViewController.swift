//
//  ViewController.swift
//  MissionBriefing-Swift
//
//  Created by Apple on 4/1/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet var agentNameTextField : UITextField!
    @IBOutlet var agentPasswordTextField : UITextField!
    @IBOutlet var greetingLabel : UILabel!
    @IBOutlet var missionBriefingTextView : UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
        agentNameTextField.text = ""
        agentPasswordTextField.text = ""
        missionBriefingTextView.text = ""
    }
    
    @IBAction func authenticateAgent(sender : AnyObject)
    {
        if agentNameTextField.isFirstResponder()
        {
            agentPasswordTextField.becomeFirstResponder()
        }
        else if agentPasswordTextField.isFirstResponder()
        {
            agentPasswordTextField.resignFirstResponder()
        }
        agentAuthenticator()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if !textField.text.isEmpty
        {
            if textField == agentNameTextField
            {
                agentPasswordTextField.becomeFirstResponder()
            }
            else if textField == agentPasswordTextField
            {
                agentAuthenticator()
                agentPasswordTextField.resignFirstResponder()
            }
            rc = true
        }
        return rc
    }
    
    func agentAuthenticator()
    {
        if !agentPasswordTextField.text.isEmpty && !agentNameTextField.text.isEmpty
        {
            var nameParts : [String] = agentNameTextField.text.componentsSeparatedByString(" ")
            var agentName : String = nameParts[0]
            
            if nameParts.count == 2
            {
                agentName = nameParts[1]
            }
            greetingLabel.text = "Good evening, Agent \(agentName)"
            
            missionBriefingTextView.text = "This mission will be an arduous one, fraught with peril. You will cover much strange and unfamiliar territory. Should you choose to accept this mission, Agent \(agentName), you will certainly be disavowed, but you will be doing your country a great service. This message will self destruct in 5 seconds."
            
            let authenticatedBackgroundColor = UIColor(red: 0.585, green: 0.78, blue: 0.188, alpha: 1)
            self.view.backgroundColor = authenticatedBackgroundColor
        }
        else
        {
            let accessDeniedBackgroundColor = UIColor(red: 0.78, green: 0.188, blue: 0.188, alpha: 1)
            self.view.backgroundColor = accessDeniedBackgroundColor
        }

    }


}

