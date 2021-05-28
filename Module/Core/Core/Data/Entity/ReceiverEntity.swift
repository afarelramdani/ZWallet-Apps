//
//  ReceiverEntity.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import Foundation

public struct ReceiverEntity {
    public var id: Int
    public var phone: String
    public var name: String
    public var image: String
    
    public init(id: Int, phone: String, name: String,  image: String) {
        self.id = id
        self.phone = phone
        self.name = name
        self.image = image
    }
}
