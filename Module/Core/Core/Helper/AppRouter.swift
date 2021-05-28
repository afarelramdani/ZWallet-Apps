//
//  AppRouter.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit

public class AppRouter {
    
    public static let shared: AppRouter = AppRouter()
    
    public var loginScene: (() -> ())? = nil
    public func navigateToLogin() {
        self.loginScene?()
    }
    
    public var homeScene: (() -> ())? = nil
    public func navigateTohome() {
        self.homeScene?()
    }
    
    public var historyScene: ((_ viewController: UIViewController) -> ())? = nil
    public func navigateToHistory(_ viewController: UIViewController) {
        self.historyScene?(viewController)
    }
    
    public var registerScene: ((_ viewController: UIViewController) -> ())? = nil
    public func navigateToRegister(_ viewController: UIViewController) {
        self.registerScene?(viewController)
    }
    
    public var otpScene: (() -> ())? = nil
    public func navigateToOtpConfirmation() {
        self.otpScene?()
    }
    
    public var pinScene: (() -> ())? = nil
    public func navigateToPinActivation() {
        self.pinScene?()
    }
    
    public var receiverScene: ((_ viewController: UIViewController) -> ())? = nil
    public func navigateToReceiver(_ viewController: UIViewController) {
        self.receiverScene?(viewController)
    }
    
}
