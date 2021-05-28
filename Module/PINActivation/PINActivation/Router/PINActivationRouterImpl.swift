//
//  PINActivationRouterImpl.swift
//  PINActivation
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Core
import UIKit

public class PINActivationRouterImpl {
    public static func navigateToModule() {
        let bundle = Bundle(identifier: "com.casestudy.PINActivation")
        let vc = PINActivationViewController(nibName: "PINActivationViewController", bundle: bundle)
        
        let networkManager = AuthNetworkManagerImpl()
        
        let router = PINActivationRouterImpl()
        let interactor = PINActivationInteractorImpl(networkManager: networkManager)
        let presenter = PINActivationPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        let navController = UINavigationController(rootViewController: vc)
        navController.setNavigationBarHidden(true, animated: false)
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
}


extension PINActivationRouterImpl:  PINActivationRouter {
    func navigateToHome() {
        AppRouter.shared.navigateTohome()
    }
    
    func navigateTologin() {
        AppRouter.shared.navigateToLogin()
    }
}
