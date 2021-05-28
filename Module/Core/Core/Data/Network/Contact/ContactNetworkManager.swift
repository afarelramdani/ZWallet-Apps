//
//  ContactNetworkManager.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import Foundation

public protocol ContactNetworkManager {
    func getAllContact(completion: @escaping ([GetContactDataResponse]?, Error?) -> ())
}
