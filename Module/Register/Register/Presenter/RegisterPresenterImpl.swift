//
//  RegisterPresenterImpl.swift
//  Register
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

class RegisterPresenterImpl: RegisterPresenter {
    let view: RegisterView
    let interactor: RegisterInteractor
    let router: RegisterRouter
    
    init(view: RegisterView, interactor: RegisterInteractor, router: RegisterRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func register(username: String, email: String, password: String) {
        self.interactor.postRegisterData(username: username, email: email, password: password)
    }

}

extension RegisterPresenterImpl: RegisterInteractorOutput {
    func registerResult(isSuccess: Bool) {
        if isSuccess {
            self.router.navigateToOTPConfimartion()
        } else {
            self.view.showError()
        }
    }

}



    
