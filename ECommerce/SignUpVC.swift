//
//  ViewController.swift
//  ECommerce
//
//  Created by aditya sharma on 08/08/23.
//  Modified by Aditya Vyavahare

import UIKit
import Security

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
    var isUsernameValid = false
    var isTermsChecked = false
    var isPasswordVisible = false
    var isConfirmPasswordVisible = false
    var ValidPasswordEntered = false
    var validEmailEntered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaultUI()
        
        //delegate declaration
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
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
        
        //username check will be included later once backend is integrated
        if isTermsChecked == true && validEmailEntered == true && ValidPasswordEntered == true {
            //fetch values to save to keychain
            guard let username = usernameTextField.text, !username.isEmpty,
                  let password = passwordTextField.text, !password.isEmpty,
                  let email = emailTextField.text, !email.isEmpty else {
                // Handle case where required fields are empty
                return
            }
            // Save username and password in Keychain
            do {
                try KeychainService.savePassword(password, forAccount: username)
                print("Password saved successfully.")
            } catch {
                // Handle error saving to Keychain
                print("Error saving to Keychain: \(error)")
                return
            }
        } else {
            termsConditionsCheckbox.backgroundColor = UIColor.red.withAlphaComponent(0.5)
            
            let alertController = UIAlertController(title: "Signup Failed", message: "Please enter valid information.", preferredStyle: .alert)
            // Add actions (buttons) to the alert
            let okAction = UIAlertAction(title: "Got it!", style: .default) { _ in
                // Handle OK button action
            }
            alertController.addAction(okAction)
            // Present the alert controller
            present(alertController, animated: true, completion: nil)
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
        termsConditionsCheckbox.backgroundColor = .clear
        isTermsChecked.toggle()
        updateCheckboxState()
    }
    func updateCheckboxState() {
        let imageName = isTermsChecked ? "ic_checkboxSelected" : "ic_checkboxUnselected"
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

extension SignUpVC: UITextFieldDelegate {
    
    //clear error indication when editing
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == usernameTextField {
            textField.backgroundColor = .clear
        }
        
        if textField == emailTextField {
            textField.backgroundColor = .clear
        }
        
        if textField == passwordTextField || textField == confirmPasswordTextField {
            textField.backgroundColor = .white // Reset background color
            textField.layer.borderColor = UIColor.lightGray.cgColor // Reset border color
        }
    }
    
    //show invalid input indications
    func textFieldDidEndEditing(_ textField: UITextField) {
        if usernameTextField.text == "" {
            usernameTextField.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        }

        let emailValidated = validateEmail(emailTextField.text ?? "")
        
        if emailValidated {
            validEmailEntered = true
        } else {
            emailTextField.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        }
        
        if textField == confirmPasswordTextField {
            // Check if passwords match
            let passwordsMatch = passwordTextField.text == confirmPasswordTextField.text
            if passwordsMatch == true {
                let passwordValidated = validatePassword(mypassword: confirmPasswordTextField.text ?? "")
                if passwordValidated {
                    ValidPasswordEntered = true
                    print("PASSWORD VALID")
                } else {
                    ValidPasswordEntered = false
                }
            }
            textField.backgroundColor = passwordsMatch ? .white : UIColor.red.withAlphaComponent(0.5)
            confirmPasswordTextField.layer.borderColor = passwordsMatch ? UIColor.lightGray.cgColor : UIColor.red.cgColor
        }
    }
}
