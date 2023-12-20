//
//  ViewController.swift
//  MVVMExampleIOS
//
//  Created by nhi.luu on 18/12/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = LoginViewModel(email: "", password: "")
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        updateView()
    }
    
    func updateView(){
        emailTextField.text = viewModel.email
        passwordTextField.text = viewModel.password
    }
    
    
    @IBAction func login(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        let complete: LoginViewModel.Completion = { (result) in
            switch result {
            case .success:
                print("success")
                self.updateView()
            case .failure(let isError, let errorMsg):
                if isError{
                    print("fail: \(errorMsg)")
                }
            }
        }
        
        viewModel.login(email: email, password: password, completion: complete)
    }
    
    
}

