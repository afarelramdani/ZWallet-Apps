//
//  AuthNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Moya

public class AuthNetworkManagerImpl: AuthNetworkManager {
    public init() {
        
    }
    
    public func login(email: String, password: String, completion: @escaping (LoginResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.login(email: email, password: password)) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let loginResponse = try decoder.decode(LoginResponse.self, from: result.data)
                    completion(loginResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func register(username: String, email: String, password: String, completion: @escaping (CommonResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>(plugins:[NetworkLoggerPlugin(configuration: .init(logOptions:.verbose))])
        provider.request(.register(username: username, email: email, password: password)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let newUser = try! JSONDecoder().decode(CommonResponse.self, from: response.data)
                    completion(newUser, nil)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func confirmOtp(email: String, otp: String, completion: @escaping (CommonResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.confirmOTP(email: email, otp: otp)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let confirmOTP = try! JSONDecoder().decode(CommonResponse.self, from: response.data)
                    completion(confirmOTP, nil)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func pinActivation(pin: String, completion: @escaping (CommonResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.pinActivation(pin: pin)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let pinActivation = try! JSONDecoder().decode(CommonResponse.self, from: response.data)
                    completion(pinActivation, nil)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func refreshToken(email: String, refreshToken: String, completion: @escaping (RefreshTokenDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.refreshToken(email: email, refreshToken: refreshToken)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let refreshToken = try! JSONDecoder().decode(RefreshTokenResponse.self, from: response.data)
                    completion(refreshToken.data, nil)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
  
    
    
}
