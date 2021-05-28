//
//  HistoryRouterImpl.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core


public class HistoryRouterImpl {
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.History")
        let vc = HistoryViewController(nibName: "HistoryViewController", bundle: bundle)
        
        let balanceNetworkManager = BalanceNetworkManagerImpl()
        let invoiceNetworkManager = InvoiceNetworkManagerImpl()
        
        let router = HistoryRouterImpl()
        let interactor = HistoryInteractorImpl(balanceNetworkManager: balanceNetworkManager, invoiceNetworkManager: invoiceNetworkManager)
        let presenter = HistoryPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        
       // viewController.present(vc, animated: true, completion: nil)
        viewController.navigationController?.setNavigationBarHidden(true, animated: false)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HistoryRouterImpl: HistoryRouter {
    func navigateToHome() {
        AppRouter.shared.navigateTohome()
    }
    
    func navigateTologin() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
    
}
