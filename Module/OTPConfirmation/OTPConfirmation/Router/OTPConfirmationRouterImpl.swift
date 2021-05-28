//
//  OTPConfirmationRouterImpl.swift
//  OTPConfirmation
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Core
import UIKit

public class OTPConfirmationRouterImpl {
    public static func navigateToModule() {
        let bundle = Bundle(identifier: "com.casestudy.OTPConfirmation")
        let vc = OTPConfirmationViewController(nibName: "OTPConfirmationViewController", bundle: bundle)
        
        let networkManager = AuthNetworkManagerImpl()
        
        let router = OTPConfirmationRouterImpl()
        let interactor = OTPConfirmationInteractorImpl(networkManager: networkManager)
        let presenter = OTPConfirmationPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        let navController = UINavigationController(rootViewController: vc)
        navController.setNavigationBarHidden(true, animated: false)
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
}


extension OTPConfirmationRouterImpl:  OTPConfirmationRouter {
    func navigateTologin() {
        AppRouter.shared.navigateToLogin()
    }
}
