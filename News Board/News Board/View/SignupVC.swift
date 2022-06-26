//
//  SignupVC.swift
//  News Board
//
//  Created by Spemai-Macbook on 2022-06-25.
//

import UIKit

class SignupVC: UIViewController {
    
    //MARK: @IBOutlets
    @IBOutlet weak var btnSigup: UIButton!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    //MARK: - Instance Variables
    let viewModel = SignupViewModel()
    let progressHUD  = ProgressHUD(text: "Loading...")

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
    @IBAction func signupBtnTap(_ sender: Any) {
        
        self.progressHUD.show()
        
        let username = txtUsername.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let confirmPassword = txtConfirmPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let (valid, error) = viewModel.inputValidation(username: username, password: password, confirm_password: confirmPassword)
        
        if valid {
            
            AppSessionManager.saveUsername(name: username!)
            AppSessionManager.saveAuthPassword(password: password!)
            AppSessionManager.userDefaultsync()
            
            self.progressHUD.hide()
            
            Alert.showMessageWithTask(on: self, msg: Constant.USER_CREATE_SUCCESS){
                
                _ = self.navigationController?.popViewController(animated: true)
            }
            
            
        } else {
            self.progressHUD.hide()
            Alert.showMessage(msg: error, on: self)
        }
        
    }
    
    
    //MARK: - Custom Methods
    func setupUI() {
        
        self.view.addSubview(progressHUD)
        progressHUD.hide()
        
        btnSigup.layer.cornerRadius = 24
    }
    
}
