//
//  LoginRouterImpl.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit
import Core

public class LoginRouterImpl {
    public static func navigateToModule() {
        let bundle = Bundle(identifier: "com.casestudy.Login")
        let vc = LoginViewController(nibName: "LoginViewController", bundle: bundle)
        
        let networkManager = AuthNetworkManagerImpl()
        
        let router = LoginRouterImpl()
        let interactor = LoginIntercatorImpl(networkmanager: networkManager)
        let presenter = LoginPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
}

extension LoginRouterImpl: LoginRouter {
    func navigateToOtpConfirmation() {
        AppRouter.shared.navigateToOtpConfirmation()
    }
    
    func navigateToHome() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    func navigateToRegister(viewController: UIViewController) {
        AppRouter.shared.registerScene!(viewController)
    }
    
    func navigateToPinActivation() {
        AppRouter.shared.navigateToPinActivation()
    }
    
    
}
