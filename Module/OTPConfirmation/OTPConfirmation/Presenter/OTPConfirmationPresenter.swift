//
//  OTPConfirmationPresenter.swift
//  OTPConfirmation
//
//  Created by MacBook on 27/05/21.
//

import Foundation

protocol OTPConfirmationPresenter {
    func confirmOTP(email: String, otp: String)
}
