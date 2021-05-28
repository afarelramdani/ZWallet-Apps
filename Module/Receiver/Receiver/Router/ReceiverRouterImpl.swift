//
//  ReceiverRouterImpl.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

public class ReceiverRouterImpl {
    
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.Receiver")
        let vc = ReceiverViewController(nibName: "ReceiverViewController", bundle: bundle)
        
        let networkManager = ContactNetworkManagerImpl()
        
        let router = ReceiverRouterImpl()
        
        let interactor = ReceiverInteractorImpl(contactNetworkManager: networkManager)
        let presenter = ReceiverPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        
        
        
        viewController.navigationController?.setNavigationBarHidden(true, animated: false)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ReceiverRouterImpl: ReceiverRouter {
    public func navigateToHome(viewController: UIViewController) {
        AppRouter.shared.navigateTohome()
    }
    
    public func navigateToTransaction(viewController: UIViewController) {
        AppRouter.shared.navigateTohome()
    }
    
    
}
