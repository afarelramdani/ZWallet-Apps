//
//  GetContactResponse.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import Foundation

public struct GetContactResponse: Codable {
    var status: Int
    var message: String
    var data: [GetContactDataResponse]
}
