//
//  LogIn.swift
//  Ikonagram
//
//  Created by Omar on 11/28/15.
//  Copyright © 2015 Kroleo. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class LogIn: UIViewController,FBSDKLoginButtonDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        if(FBSDKAccessToken.currentAccessToken() == nil){
            print("NOT LOGGED IN")
            
        }else{
            //Configure that if logged in move directly to
            print("ALREADY LOGGED IN")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let mapViewControllerObejct = storyBoard.instantiateViewControllerWithIdentifier("MapViewControllerIdentifier") as? StepOne
            self.presentViewController(mapViewControllerObejct!, animated:true, completion:nil)
            
        }
        
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile","email" ,"user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
        
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if(error == nil){
            print("LOGIN SUCCESSFUL")
            self.performSegueWithIdentifier("desginPage", sender: self)
        }else{
            print(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("LOGGED OUT")
    }
}

