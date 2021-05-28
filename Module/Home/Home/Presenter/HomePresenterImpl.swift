//
//  HomePresenterImpl.swift
//  Home
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit
import Core

class HomePresenterImpl: HomePresenter {
    let view: HomeView
    let interactor: HomeInteractor
    let router: HomeRouter
    
    init(view: HomeView, interactor: HomeInteractor, router: HomeRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func showReceiver(viewController: UIViewController) {
        self.router.navigateToReceiver(viewController: viewController)
    }
    
    func showHistory(viewController: UIViewController) {
        self.router.navigateToHistory(viewController: viewController)
    }
    
    func loadProfile() {
        self.interactor.getUserProfile()
    }
    
    func loadTransaction() {
        self.interactor.getTransaction()
    }
    
    func logout() {
        UserDefaultHelper.shared.remove(key: .userToken)
        self.router.navigateTologin()
    }
}

extension HomePresenterImpl: HomeInteractorOutput {
    func loadedUserProfileData(userProfile: UserProfileEntity) {
        self.view.showUserProfileData(userProfile: userProfile)
    }
    
    func loadedTransaction(transaction: [TransactionEntity]) {
        self.view.showTransactionData(transactions: transaction)
    }
    
    
}
