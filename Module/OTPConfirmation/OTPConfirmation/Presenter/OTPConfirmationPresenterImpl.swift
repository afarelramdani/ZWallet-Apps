//
//  OTPConfirmationPresenterImpl.swift
//  OTPConfirmation
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit

public class OTPConfirmationPresenterImpl: OTPConfirmationPresenter {
    
    let view: OTPConfirmationView
    let interactor: OTPConfirmationInteractor
    let router: OTPConfirmationRouter
    
    init(view: OTPConfirmationView, interactor: OTPConfirmationInteractor, router: OTPConfirmationRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
    func confirmOTP(email: String, otp: String) {
        self.interactor.postOTPConfirmation(email: email, otp: otp)
    }
    
    
}

extension OTPConfirmationPresenterImpl: OTPConfirmationInteractorOutput {
    func otpResult(isSuccess: Bool) {
        if isSuccess {
            self.router.navigateTologin()
        } else {
            self.view.showError()
        }

    }
}
