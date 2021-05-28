//
//  RegisterRouterImpl.swift
//  Register
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

public class RegisterRouterImpl {
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.Register")
        let vc = RegisterViewController(nibName: "RegisterViewController", bundle: bundle)
        
        let networkManager = AuthNetworkManagerImpl()
        
        let router = RegisterRouterImpl()
        let interactor = RegisterInteractorImpl(networkManager: networkManager)
        let presenter = RegisterPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
}

extension RegisterRouterImpl: RegisterRouter {
    func navigateToOTPConfimartion() {
        AppRouter.shared.navigateToOtpConfirmation()
    }
    
//    func navigateToOTPConfimartion(email: String, viewController: UIViewController) {
//        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
//    }
}
