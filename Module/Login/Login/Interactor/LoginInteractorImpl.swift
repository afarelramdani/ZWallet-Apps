//
//  LoginInteractorImpl.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Core

class LoginIntercatorImpl: LoginInteractor {
    var interactorOutput: LoginInteractorOutput?
    let authNetworkManager: AuthNetworkManager
    
    init(networkmanager: AuthNetworkManager) {
        self.authNetworkManager = networkmanager
    }
    
    func postLoginData(email: String, password: String) {
        self.authNetworkManager.login(email: email, password: password) { data, error in
            if let loginData = data {
                UserDefaultHelper.shared.set(key: .userToken, value: loginData.data.token)
                UserDefaultHelper.shared.set(key: .userEmail, value: email)
                UserDefaultHelper.shared.set(key: .refreshToken, value: loginData.data.refreshToken)
                
                let tokenExpiredDate: Date = Calendar.current.date(byAdding: .second, value: loginData.data.expiredIn / 1000, to: Date()) ?? Date()
                
                UserDefaultHelper.shared.set(key: .userTokenExpired, value: tokenExpiredDate)
                
                self.interactorOutput?.authenticationResult(isSuccess: true, status: loginData.status, message: loginData.message, hasPin: loginData.data.hasPin)
            } else {
                self.interactorOutput?.authenticationResult(isSuccess: false, status: data?.status ?? 0, message: data?.message ?? "", hasPin: (data?.data.hasPin)!)
            }
        }
    }
}
