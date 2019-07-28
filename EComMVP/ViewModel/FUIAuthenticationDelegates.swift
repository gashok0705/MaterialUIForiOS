//
//  FUIAuthenticationDelegates.swift
//  EComMVP
//
//  Created by Rajagopal Ganesan on 13/07/19.
//  Copyright © 2019 Rajagopal Ganesan. All rights reserved.
//

import UIKit
import FirebaseUI

protocol FUIAuthenticationProtocol: NSObjectProtocol {
    
    func didSignIn(authUI: FUIAuth, signinWithResult: AuthDataResult?, error_: Error?)
}

class FUIAuthenticationDelegates: NSObject {

    var delegate: FUIAuthenticationProtocol?
}

extension FUIAuthenticationDelegates: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        if let delegate_ = self.delegate {
            delegate_.didSignIn(authUI: authUI, signinWithResult: authDataResult, error_: error)
        }
        
    }
    
}
