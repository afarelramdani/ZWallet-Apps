//
//  RegisterInteractorImpl.swift
//  Register
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import Core

class RegisterInteractorImpl: RegisterInteractor {
    
    let authNetworkManager: AuthNetworkManager
    var interactorOutput: RegisterInteractorOutput?
    
    init(networkManager: AuthNetworkManager){
        self.authNetworkManager = networkManager
    }
    
    
    func postRegisterData(username: String, email: String, password: String) {
        self.authNetworkManager.register(username: username, email: email, password: password) { (data, error) in
            if data?.status == 200 {
                UserDefaultHelper.shared.set(key: .userEmail, value: email)
                self.interactorOutput?.registerResult(isSuccess: true)
            } else {
                self.interactorOutput?.registerResult(isSuccess: false)
            }
        }
    }
    
}
