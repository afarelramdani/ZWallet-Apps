//
//  OTPConfirmationInteractor.swift
//  OTPConfirmation
//
//  Created by MacBook on 27/05/21.
//

import Foundation

protocol OTPConfirmationInteractor {
    func postOTPConfirmation(email: String, otp: String)
}
