//
//  RegistrationViewController.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/19/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class RegistrationViewController: UIViewController {
    
    let registerView = RegistrationView()
    let childProgressView = ProgressSpinnerViewController()
    var currentUser: FirebaseAuth.User?
    let database = Firestore.firestore()
    
    override func loadView() {
        view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Register"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        
        //button-click for profile creation
        registerView.createProfileButton.addTarget(self, action: #selector(attemptUserRegistration), for: .touchUpInside)
        
    }
    
    @objc func attemptUserRegistration() {
        
        let nameInput = registerView.nameTextField.text
        let emailInput = registerView.emailTextField.text
        let passwordInput = registerView.passwordTextField.text
        let reenteredPasswordInput = registerView.reenterPasswordTextField.text
        
        //validate text inputs of user
        if let uwName = nameInput {
            if !uwName.isEmpty {
                if let uwEmail = emailInput {
                    if !uwEmail.isEmpty {
                        if(validateEmail(uwEmail)){
                            if let uwPassword = passwordInput {
                                if !uwPassword.isEmpty {
                                    if let uwReenterPassword = reenteredPasswordInput {
                                        if !uwReenterPassword.isEmpty {
                                            if(validatePassword(uwPassword, uwReenterPassword)){
//                                                registerNewAccount(uwName, uwEmail, uwPassword)
                                                print("newUserAccount registration")
                                            }
                                            else {
                                                showErrorAlert(message: "Passwords do not match")
                                            }
                                        }
                                        else {
                                            showErrorAlert(message: "Please re-enter your Password")
                                        }
                                    }
                                }
                                else {
                                    showErrorAlert(message: "Please enter a Password")
                                }
                            }
                        }
                        else {
                            showErrorAlert(message: "Please enter a valid Email ID")
                        }
                    }
                    else {
                        showErrorAlert(message: "Please enter an Email")
                    }
                }
            }
            else {
                showErrorAlert(message: "Please enter a Name")
            }
        }
    }
    
    //email validation
    func validateEmail(_ email:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    //password confirmation
    func validatePassword(_ password1:String, _ password2:String) -> Bool {
        if(password2==password1){
            return true
        }
        else {
            return false
        }
    }
    
    @objc func cancelButtonTapped() {
        
        let discardAlert = UIAlertAction(title: "Discard", style: .destructive) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        
        let alert = UIAlertController(title: "Discard Changes?", message: "Any changes made to this contact will be discarded", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        alert.addAction(discardAlert)
        self.present(alert, animated: true)
    }
    
    func showErrorAlert(message: String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
}
