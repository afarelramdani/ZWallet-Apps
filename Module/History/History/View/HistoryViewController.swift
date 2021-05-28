//
//  HistoryViewController.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import UIKit
import Core

class HistoryViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var backButton: UIButton!
    
    var dataSource = HistoryDataSource()
    var presenter: HistoryPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpTableView()
        self.presenter?.loadTransactionThisWeek()
        self.presenter?.loadTransactionThisMonth()
    }

    
    func setUpTableView() {
        self.dataSource.viewController = self
    
        self.tableView.register(UINib(nibName: "TransactionCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "TransactionCell")
        
        self.tableView.dataSource = self.dataSource
    }
    @IBAction func backToHomeAction(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension HistoryViewController: HistoryView {
    func showHistoryThisWeek(transactionThisWeek: [TransactionEntity]) {
        self.dataSource.historyThisWeek = transactionThisWeek
        self.tableView.reloadData()
    }
    
    func showHistoryThisMonth(transactionsThisMonth: [TransactionEntity]) {
        self.dataSource.historyThisMonth = transactionsThisMonth
        self.tableView.reloadData()
    }

}
