//
//  PINConfirmationInteractir.swift
//  PINConfirmation
//
//  Created by MacBook on 27/05/21.
//

import Foundation

protocol PINConfirmationInteractor {
    func postPINConfirmation(email: String, otp: String)
}
