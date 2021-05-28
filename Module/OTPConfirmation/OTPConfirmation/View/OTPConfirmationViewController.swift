//
//  OTPConfirmationViewController.swift
//  OTPConfirmation
//
//  Created by MacBook on 27/05/21.
//

import UIKit
import Core

class OTPConfirmationViewController: UIViewController {

    @IBOutlet var otpText: UITextField!
    var presenter: OTPConfirmationPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func confirmAction(_ sender: Any) {
        let otp = otpText.text ?? ""
        let email: String? = UserDefaultHelper.shared.get(key: .userEmail)
        self.presenter?.confirmOTP(email: email ?? "", otp: otp)
    }
    

}
extension OTPConfirmationViewController: OTPConfirmationView {
    func showError() {
        let alert = UIAlertController(
            title: "Peringatan",
            message: "Username atau password salah, silahkan coba lagi",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

