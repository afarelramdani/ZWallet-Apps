//
//  AuthApi.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Moya

public enum AuthApi {
    case login(email: String, password: String)
    case register(username: String, email: String, password: String)
    case confirmOTP(email: String, otp: String)
    case pinActivation(pin: String)
    case refreshToken(email: String, refreshToken: String)
}

extension AuthApi: TargetType {
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        case .confirmOTP:
            return .get
        case .pinActivation:
            return .patch
        case .refreshToken:
            return .post
        }
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        switch self {
        case .pinActivation, .refreshToken:
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)"
            ]
            
        default:
            return [
                "Content-Type": "application/json",
            ]
        }
    }
    
    public var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .register:
            return "/auth/signup"
        case .confirmOTP(let email, let otp):
            return "/auth/activate/\(email)/\(otp)"
        case .pinActivation:
            return "/auth/PIN"
        case .refreshToken:
            return "/auth/refresh-token"
        }
    }
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .login(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case .register(let username, let email, let password):
            return .requestParameters(parameters: ["username": username, "email": email, "password": password], encoding: JSONEncoding.default)
        case .confirmOTP:
            return .requestPlain
        case .pinActivation(pin: let pin):
            return .requestParameters(parameters: ["PIN": pin], encoding: JSONEncoding.default)
        case .refreshToken(let email, let refreshToken):
            return .requestParameters(parameters: ["email": email, "refreshToken": refreshToken], encoding: JSONEncoding.default)
        }
        
    }
}
