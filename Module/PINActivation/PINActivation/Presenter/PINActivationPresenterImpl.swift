//
//  PINActivationPresenterImpl.swift
//  PINActivation
//
//  Created by MacBook on 27/05/21.
//

import Foundation

public class PINActivationPresenterImpl: PINActivationPresenter{
 
    let view: PINActivationView
    let interactor: PINActivationInteractor
    let router: PINActivationRouter
    
    init(view: PINActivationView, interactor: PINActivationInteractor, router: PINActivationRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func pinActivation(pin: String) {
        self.interactor.postPINConfirmation(pin: pin)
    }
}

extension PINActivationPresenterImpl: PINActivationInteractorOutput {
    func pinResult(isSuccess: Bool) {
        if isSuccess {
            self.router.navigateToHome()
        } else {
            self.view.showError()
        }
    }
}
