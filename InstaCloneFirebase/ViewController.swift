//
//  ViewController.swift
//  InstaCloneFirebase
//
//  Created by Mahmut Yazar on 18.05.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//Hide Keyboard
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    

    @IBAction func signInClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                
                if error != nil {
                    
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                    
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
                
            }
            
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
            }
        }
    func makeAlert(titleInput:String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

