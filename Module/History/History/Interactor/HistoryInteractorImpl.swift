//
//  HistoryInteractorImpl.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

class HistoryInteractorImpl: HistoryInteractor {
    
    var interactorOutput: HistoryInteractorOutput?
    
    let balanceNetworkManager: BalanceNetworkManager
    let invoiceNetworkManager: InvoiceNetworkManager
    
    init(balanceNetworkManager: BalanceNetworkManager, invoiceNetworkManager: InvoiceNetworkManager) {
        self.balanceNetworkManager = balanceNetworkManager
        self.invoiceNetworkManager = invoiceNetworkManager
    }

    func getTransactionThisWeek() {
        self.invoiceNetworkManager.getThisWeekInvoice { (data, error) in
            var transaction: [TransactionEntity] = []
            
            data?.forEach({ (invoiceData) in
                transaction.append(TransactionEntity(name: invoiceData.name, type: invoiceData.type, imageUrl: "\(AppConstant.baseUrl)\(invoiceData.image)", amount: invoiceData.amount, notes: invoiceData.notes))
                
                print(transaction)
                self.interactorOutput?.loadedTransactionThisWeek(transaction: transaction)
            })
        }
    }
    
    func getTransactionThisMonth() {
        self.invoiceNetworkManager.getThisWeekInvoice { (data, error) in
            var transaction: [TransactionEntity] = []
            
            data?.forEach({ (invoiceData) in
                transaction.append(TransactionEntity(name: invoiceData.name, type: invoiceData.type, imageUrl: "\(AppConstant.baseUrl)\(invoiceData.image)", amount: invoiceData.amount, notes: invoiceData.notes))
                
                self.interactorOutput?.loadedTransactionThisMonth(transaction: transaction)
            })
        }
    }
    
    
}
