//
//  LoginViewController.swift
//  Register
//
//  Created by MacBook on 27/05/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var usernameText: UITextField!
    
    @IBOutlet var emailText: UITextField!
    
    @IBOutlet var passwordText: UITextField!
    

    
    var presenter: RegisterPresenter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

 
    }
    @IBAction func registerAction(_ sender: Any) {
        let username: String = usernameText.text ?? ""
        let email: String = emailText.text ?? ""
        let password: String = passwordText.text ?? ""
        
        presenter?.register(username: username, email: email, password: password)
        
    }
    
}

extension RegisterViewController : RegisterView {
    func showError() {
        let alert = UIAlertController(
            title: "Peringatan",
            message: "Username atau password salah, silahkan coba lagi",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
