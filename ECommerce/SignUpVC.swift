//
//  ViewController.swift
//  ECommerce
//
//  Created by aditya sharma on 08/08/23.
//  Modified by Aditya Vyavahare

import UIKit

class SignUpVC: UIViewController {

    //username
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameAvailableIndicator: UIImageView!
    
    //email
    @IBOutlet weak var emailTextField: UITextField!
    
    //password
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var viewPasswordIcon: UIImageView!
    
    //confirm password
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var viewConfirmPasswordIcon: UIImageView!
    
    //T&C
    @IBOutlet weak var termsConditionsCheckbox: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signupButtonTapped(_ sender: UIButton) {
    }
    
}

