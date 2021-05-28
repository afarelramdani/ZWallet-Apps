//
//  PINActivationViewController.swift
//  PINActivation
//
//  Created by MacBook on 27/05/21.
//

import UIKit

class PINActivationViewController: UIViewController {
    
    @IBOutlet var pinText: UITextField!
    var presenter: PINActivationPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    @IBAction func confirmPinAction(_ sender: Any) {
        let pin = pinText.text ?? ""
        
        self.presenter?.pinActivation(pin: pin)
    }
}

extension PINActivationViewController: PINActivationView {
    func showError() {
        let alert = UIAlertController(
            title: "Peringatan",
            message: "Username atau password salah, silahkan coba lagi",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}


