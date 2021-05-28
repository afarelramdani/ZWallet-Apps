//
//  ContactNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import Moya

public class ContactNetworkManagerImpl: ContactNetworkManager {
    public init() {
        
    }
    
    public func getAllContact(completion: @escaping ([GetContactDataResponse]?, Error?) -> ()) {
        let provider = MoyaProvider<ContactApi>(isRefreshToken: true)
        provider.request(.getContact) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let getContactResponse = try decoder.decode(GetContactResponse.self, from: result.data)
                    completion(getContactResponse.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
