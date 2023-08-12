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
    //signup button
    @IBOutlet weak var signupButton: UIButton!
    
    // Keeps track of the toggle state
    var isTermsChecked = false
    var isPasswordVisible = false
    var isConfirmPasswordVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaultUI()
        // Enable toggle functionality
        let checkboxTapGesture = UITapGestureRecognizer(target: self, action: #selector(termsCheckboxTapped))
        termsConditionsCheckbox.isUserInteractionEnabled = true
        termsConditionsCheckbox.addGestureRecognizer(checkboxTapGesture)
        let showPasswordtapGesture = UITapGestureRecognizer(target: self, action: #selector(showPasswordTapped))
        viewPasswordIcon.isUserInteractionEnabled = true
        viewPasswordIcon.addGestureRecognizer(showPasswordtapGesture)
        let showConfirmPasswordtapGesture = UITapGestureRecognizer(target: self, action: #selector(showConfirmPasswordTapped))
        viewConfirmPasswordIcon.isUserInteractionEnabled = true
        viewConfirmPasswordIcon.addGestureRecognizer(showConfirmPasswordtapGesture)
    }
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        if emailTextField.text != "" {
            let emailValidated = validateEmail(emailTextField.text!)
        }
        
        
        if usernameTextField != "" && 
        
        if(passwordTextField.text != confirmPasswordTextField.text){
            
            
            let alertController = UIAlertController(title: "Sign Up Failed", message: "Sorry, your Passwords were not matching.", preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // ...
            }
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true) {
                // ...
            }
        }
        
    }
    
}

extension SignUpVC {
    func setupDefaultUI() {
        //toggle items
        termsConditionsCheckbox.image = UIImage(named: "ic_checkboxUnselected")
        viewPasswordIcon.image = UIImage(named: "ic_showPassword")
        viewConfirmPasswordIcon.image = UIImage(named: "ic_showPassword")
        
        //textfields
        usernameTextField.borderStyle = .bezel
        emailTextField.borderStyle = .bezel
        passwordTextField.borderStyle = .bezel
        confirmPasswordTextField.borderStyle = .bezel
        
        signupButton.layer.cornerRadius = 20
    }
    
    //MARK: toggle logic
    @objc func termsCheckboxTapped() {
        isTermsChecked.toggle()
        updateCheckboxState()
    }
    func updateCheckboxState() {
        let imageName = isTermsChecked ? "ic_checkboxSelected" : "ic_checkboxUnselected"
        //        let toggleState =
        termsConditionsCheckbox.image = UIImage(named: imageName)
    }
    
    @objc func showPasswordTapped() {
        isPasswordVisible.toggle()
        updateEyeIcon0()
        // Toggle secure text entry
        passwordTextField.isSecureTextEntry = !isPasswordVisible
    }
    func updateEyeIcon0() {
        let imageName = isPasswordVisible ? "ic_hidePassword" : "ic_showPassword"
        viewPasswordIcon.image = UIImage(named: imageName)
    }
    
    @objc func showConfirmPasswordTapped() {
        isConfirmPasswordVisible.toggle()
        updateEyeIcon1()
        // Toggle secure text entry
        confirmPasswordTextField.isSecureTextEntry = !isConfirmPasswordVisible
    }
    func updateEyeIcon1() {
        let imageName = isConfirmPasswordVisible ? "ic_hidePassword" : "ic_showPassword"
        viewConfirmPasswordIcon.image = UIImage(named: imageName)
    }
}