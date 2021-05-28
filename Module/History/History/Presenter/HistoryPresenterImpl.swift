//
//  HistoryPresenterImpl.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

class HistoryPresenterImpl: HistoryPresenter {
    
    
    let view: HistoryView
    let interactor: HistoryInteractor
    let router: HistoryRouter
    
    init(view: HistoryView, interactor: HistoryInteractor, router: HistoryRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func showHistory(viewController: UIViewController) {
        self.router.navigateToHome()
    }
    
    
    func loadTransactionThisWeek() {
        self.interactor.getTransactionThisWeek()
    }
    
    func loadTransactionThisMonth() {
        self.interactor.getTransactionThisMonth()
    }
    
}

extension HistoryPresenterImpl: HistoryInteractorOutput {
    func loadedTransactionThisWeek(transaction: [TransactionEntity]) {
        self.view.showHistoryThisWeek(transactionThisWeek: transaction)
    }
    
    func loadedTransactionThisMonth(transaction: [TransactionEntity]) {
        self.view.showHistoryThisMonth(transactionsThisMonth: transaction)
    }
    
}
