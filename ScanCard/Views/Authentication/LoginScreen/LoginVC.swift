//
//  LoginVC.swift
//  ScanCard
//
//  Created by Muhammad Irfan Zafar on 21/10/2024.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var txtFieldUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var viewModel: LoginViewModel!
    
    @IBAction func didSignInTapped(_ sender: UIButton) {
        viewModel.performLogin()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
