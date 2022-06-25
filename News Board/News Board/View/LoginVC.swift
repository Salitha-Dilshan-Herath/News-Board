//
//  ViewController.swift
//  News Board
//
//  Created by Spemai-Macbook on 2022-06-24.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }


    func setupUI() {
        btnLogin.layer.cornerRadius = 24
    }
}

