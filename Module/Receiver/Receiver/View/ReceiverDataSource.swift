//
//  ReceiverDataSource.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import Core
import UIKit

class ReceiverDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var viewController: ReceiverViewController!
    var receivers: [ReceiverEntity] = []
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receivers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiverCell", for: indexPath) as! ReceiverCell
        cell.showDataReceiver(receiver: self.receivers[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
