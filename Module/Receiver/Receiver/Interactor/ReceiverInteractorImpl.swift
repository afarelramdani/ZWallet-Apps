//
//  ReceiverInteractorImpl.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import Core

class ReceiverInteractorImpl: ReceiverInteractor {

    
    var interactorOutput: ReceiverInteractorOutput?
    
    let contactNetworkManager: ContactNetworkManager
    
    init(contactNetworkManager: ContactNetworkManager) {
        self.contactNetworkManager = contactNetworkManager
    }
    
    func getReceiverData() {
        self.contactNetworkManager.getAllContact { (data, error) in
            var getAllContact: [ReceiverEntity] = []
            data?.forEach({ (receiverData) in
                getAllContact.append(ReceiverEntity(id: receiverData.id, phone: receiverData.phone, name: receiverData.name, image: "\(AppConstant.baseUrl)\(receiverData.image)"))
            })
            
            print(getAllContact)
            self.interactorOutput?.loadedDataReceiver(receivers: getAllContact)
        }
    }
    

}
