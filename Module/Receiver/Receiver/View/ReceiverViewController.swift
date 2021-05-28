//
//  ReceiverViewController.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import UIKit
import Core

class ReceiverViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var dataSource = ReceiverDataSource()
    var presenter:  ReceiverPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpTableView()
        self.presenter?.loadDataReceiver()
    }
    
    func setUpTableView() {
        self.dataSource.viewController = self
        self.tableView.register(UINib(nibName: "ReceiverCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "ReceiverCell")
        
        self.tableView.delegate = self.dataSource
        self.tableView.dataSource = self.dataSource
    }
}

extension ReceiverViewController: ReceiverView {
    func showAllReceiver(receiverData: [ReceiverEntity]) {
        self.dataSource.receivers = receiverData
        self.tableView.reloadData()
    }
}
