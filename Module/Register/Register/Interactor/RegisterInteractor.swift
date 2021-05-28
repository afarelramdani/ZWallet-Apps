//
//  RegisterInteractor.swift
//  Register
//
//  Created by MacBook on 25/05/21.
//

import Foundation

protocol RegisterInteractor {
    func postRegisterData(username: String, email: String, password: String)
}
