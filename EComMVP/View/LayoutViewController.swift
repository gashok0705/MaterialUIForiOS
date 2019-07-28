//
//  LayoutViewController.swift
//  EComMVP
//
//  Created by Rajagopal Ganesan on 13/07/19.
//  Copyright © 2019 Rajagopal Ganesan. All rights reserved.
//

import UIKit
import paper_onboarding
import RevealingSplashView

class LayoutViewController: UIViewController {
    
    @IBOutlet weak var beginButton: AppButton!
    private let onboarding = PaperOnboarding()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green.adjust(by: -30)
        self.beginButton.isHidden = true
        self.initializeRevealingSplashScreen()
        // Do any additional setup after loading the view.
    }
    
    private func initializeRevealingSplashScreen() {
        //Initialize a revealing Splash with with the iconImage, the initial size and the background color
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "LaunchScreenIcon")!,iconInitialSize: CGSize(width: 200, height: 200), backgroundColor: UIColor.yellow)
        
        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.popAndZoomOut

        //Starts animation
        revealingSplashView.startAnimation(){
            DispatchQueue.main.async { [weak self] in
                if let strongSelf = self {
                    strongSelf.setUpLayoutVC()
                    strongSelf.view.bringSubviewToFront(strongSelf.beginButton)
                }
            }
        }
    }
    
    private func setUpLayoutVC() {
        onboarding.dataSource = self
        onboarding.delegate = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(onboarding)
        
        // add constraints
        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
    @IBAction func beginButtonTapped(_ sender: AppButton) {
        let destVC = (self.storyboard?.instantiateViewController(withIdentifier: LoginViewControllerId))!
        self.present(destVC, animated: true, completion: nil)
    }
    
}
extension LayoutViewController: PaperOnboardingDataSource, PaperOnboardingDelegate {
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return [
            OnboardingItemInfo(informationImage: UIImage(named: "IronBoxIcon")!,
                               title: LayoutTitle1,
                               description: LayoutDescription1,
                               pageIcon: UIImage(named: "LayoutBottomIcon1")!,
                               color: UIColor.green.adjust(by: -10)!,
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white,
                               titleFont: UIFont.appBoldFont(with: 30),
                               descriptionFont: UIFont.appMediumFont(with: 20)),
            
            OnboardingItemInfo(informationImage: UIImage(named: "WashingMachineIcon")!,
                               title: LayoutTitle2,
                               description: LayoutDescription2,
                               pageIcon: UIImage(named: "LayoutBottomIcon2")!,
                               color: UIColor.lightGray,
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white.lighter()!,
                               titleFont: UIFont.appBoldFont(with: 30),
                               descriptionFont: UIFont.appMediumFont(with: 20)),
            
            OnboardingItemInfo(informationImage: UIImage(named: "ShirtIcon")!,
                               title: LayoutTitle3,
                               description: LayoutDescription3,
                               pageIcon: UIImage(named: "LayoutBottomIcon3")!,
                               color: UIColor.yellow.adjust(by: -10)!,
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white,
                               titleFont: UIFont.appBoldFont(with: 30),
                               descriptionFont: UIFont.appMediumFont(with: 20))
            ][index]
    }
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    //Delegates
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 2 {
            self.beginButton.isHidden = false
        } else {
            self.beginButton.isHidden = true
        }
    }
    
}
