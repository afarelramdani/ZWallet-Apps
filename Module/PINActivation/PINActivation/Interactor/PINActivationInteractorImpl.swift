//
//  PINActivationInteractorImpl.swift
//  PINActivation
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Core

class PINActivationInteractorImpl: PINActivationInteractor {
  
    
    var interactorOutput: PINActivationInteractorOutput?
    let authNetworkManager: AuthNetworkManager
   
    
    init(networkManager: AuthNetworkManager){
        self.authNetworkManager = networkManager
    }
    
    func postPINConfirmation(pin: String) {
        self.authNetworkManager.pinActivation(pin: pin) { (data, error) in
            if let dataOtp = data {
                if dataOtp.status == 200 {
                    self.interactorOutput?.pinResult(isSuccess: true)
                } else {
                    self.interactorOutput?.pinResult(isSuccess: false)
                }
            }
        }
    }
}
