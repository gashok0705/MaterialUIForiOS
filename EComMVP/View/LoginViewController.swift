//
//  ViewController.swift
//  EComMVP
//
//  Created by Rajagopal Ganesan on 10/07/19.
//  Copyright © 2019 Rajagopal Ganesan. All rights reserved.
//

import UIKit
import FirebaseUI

class ViewController: UIViewController {

    private let viewModel: FUIAuthenticationDelegates = FUIAuthenticationDelegates()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        self.setUpFireBaseUI()
        // Do any additional setup after loading the view.
    }
    
    private func setUpFireBaseUI() {
        if let authUI_ = FUIAuth.defaultAuthUI() {
            authUI_.delegate = viewModel
            let providers: [FUIAuthProvider] = [
                FUIGoogleAuth(),
                FUIPhoneAuth(authUI: authUI_)
            ]
            authUI_.providers = providers
        }
    }
    
    @IBAction func signInButtonTapped(_ sender: AppButton) {
        if let authUI_ = FUIAuth.defaultAuthUI() {
            let authViewController = authUI_.authViewController()
            self.present(authViewController, animated: true, completion: nil)
        }
    }

}

extension ViewController: FUIAuthenticationProtocol {
    
    func didSignIn(authUI: FUIAuth, signinWithResult: AuthDataResult?, error_: Error?) {
        
        if let erroR_ = error_ {
            print(erroR_.localizedDescription)
            return
        }
        
        print("Authentication Success")
    }
    
}
