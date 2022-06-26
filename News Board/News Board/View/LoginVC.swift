//
//  ViewController.swift
//  News Board
//
//  Created by Spemai-Macbook on 2022-06-24.
//

import UIKit

class LoginVC: UIViewController {

    //MARK: - @IBOutlets
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblSignup: UILabel!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    //MARK: - Instance Variables
    let viewModel = LoginViewModel()
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    //MARK: - Touch Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    //MARK: - @IBActions
    @IBAction func LoginBtnTap(_ sender: Any) {
       userLogin()
    }
    
    //MARK: - Custom Methods
    func setupUI() {
        btnLogin.layer.cornerRadius = 24
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginVC.signupTap))
        lblSignup.isUserInteractionEnabled = true
        lblSignup.addGestureRecognizer(tap)
    }
    
    func userLogin() {
        let enterUsername = txtUsername.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let enterPassword = txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let (result, error) = viewModel.userValidation(username: enterUsername, password: enterPassword)
        
        if result {
            self.performSegue(withIdentifier: Constant.DASHBOARD_SEGUE, sender: nil)
            
        } else {
            Alert.showMessage(msg: error, on: self)
        }
    }
    
    @objc func signupTap(sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: Constant.SIGNUP_SEGUE, sender: nil)
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        //textField code
        if textField.tag == 0 {
            txtUsername.resignFirstResponder()
            txtPassword.becomeFirstResponder()
        } else {
            txtPassword.resignFirstResponder()
            userLogin()
        }
       
        return true
    }
}
