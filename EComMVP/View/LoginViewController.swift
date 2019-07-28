//
//  LoginViewController.swift
//  EComMVP
//
//  Created by Rajagopal Ganesan on 10/07/19.
//  Copyright © 2019 Rajagopal Ganesan. All rights reserved.
//

import UIKit
import FirebaseUI
import loady

class LoginViewController: UIViewController {

    @IBOutlet weak var signInButton: Loady!
    private let viewModel: FUIAuthenticationDelegates = FUIAuthenticationDelegates()
    @IBOutlet weak var backgroundView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        self.setUpFireBaseUI()
        self.setUpSignUpButton()
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    private func setUpSignUpButton() {
        // setup colors, titles and images
        self.signInButton?.loadingColor = UIColor(red:0.38, green:0.66, blue:0.09, alpha:1.0)
        self.signInButton?.fourPhases = (
            // normal phase
            LoadyAnimationOptions.FourPhase.Phases.normal(title: "SignIn", image: UIImage(named: "unlocked"), background: UIColor(red:0.00, green:0.49, blue:0.90, alpha:1.0)),
            
            // loading phase
            LoadyAnimationOptions.FourPhase.Phases.loading(title: "Waiting...", image: UIImage(named: ""), background: UIColor(red:0.17, green:0.24, blue:0.31, alpha:1.0)),
            
            // success phase
            LoadyAnimationOptions.FourPhase.Phases.success(title: "Success", image: UIImage(named: "locked"), background: UIColor(red:0.15, green:0.68, blue:0.38, alpha:1.0)),
            
            // error phase
            LoadyAnimationOptions.FourPhase.Phases.error(title: "Error", image: UIImage(named: "unlocked"), background: UIColor(red:0.64, green:0.00, blue:0.15, alpha:1.0))
        )
    }
    
    private func applyParallaxBackgroundEffect() {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = self.backgroundView.bounds
        view.addSubview(blurredEffectView)
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
    @IBAction func signInButtonAction(_ sender: Loady) {
        self.signInButton?.startLoading()

        
//        if let authUI_ = FUIAuth.defaultAuthUI() {
//            let authViewController = authUI_.authViewController()
//            self.present(authViewController, animated: true, completion: nil)
//        }
    }

}

extension LoginViewController: FUIAuthenticationProtocol {
    
    func didSignIn(authUI: FUIAuth, signinWithResult: AuthDataResult?, error_: Error?) {
        
        if let erroR_ = error_ {
            print(erroR_.localizedDescription)
            return
        }
        
        print("Authentication Success")
    }
    
}
