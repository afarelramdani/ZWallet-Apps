//
//  LoginDataResponse.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public struct LoginDataResponse: Codable {
    public var id: Int
    public var email: String
    public var token: String
    public var hasPin: Bool
    public var expiredIn: Int
    public var refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case token
        case hasPin
        case expiredIn = "expired_in"
        case refreshToken
    }
}
