//
//  OTPConfirmationInteractorImpl.swift
//  OTPConfirmation
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Core

class OTPConfirmationInteractorImpl: OTPConfirmationInteractor {
    
    var interactorOutput: OTPConfirmationInteractorOutput?
    let authNetworkManager: AuthNetworkManager
   
    
    init(networkManager: AuthNetworkManager){
        self.authNetworkManager = networkManager
    }
    
    
    func postOTPConfirmation(email: String, otp: String) {
        self.authNetworkManager.confirmOtp(email: email, otp: otp) { (data, error) in
            
            if let dataOtp = data {
                if dataOtp.status == 200 {
                    self.interactorOutput?.otpResult(isSuccess: true)
                } else {
                    self.interactorOutput?.otpResult(isSuccess: false)
                }
            }
            
            
        }
    }
}
