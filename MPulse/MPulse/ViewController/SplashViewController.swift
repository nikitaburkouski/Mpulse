//
//  SplashViewController.swift
//  MPulse
//
//  Created by Nikita on 9/2/21.
//

import UIKit
import FirebaseAuth
import DTCircularActivityIndicator
import GoogleSignIn

class SplashViewController: UIViewController, GIDSignInDelegate {
    
    var activityIndicator: DTCircularActivityIndicator = DTCircularActivityIndicator()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        let activityWidth: CGFloat = 150
        let activityHeigth: CGFloat = 150
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        activityIndicator = DTCircularActivityIndicator(frame: CGRect.init(x: Int((screenWidth - activityWidth) / 2) , y: Int((screenHeight - activityHeigth) / 2) , width: 150, height: 150))
        
        view.addSubview(activityIndicator)
        activityIndicator.spinDuration = 0.7
        activityIndicator.lineWidth = 10.0
        activityIndicator.colors = [UIColor.systemBlue]
        
        activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            [weak self ] in
            guard let self = self else {return}
            
            if Auth.auth().currentUser?.uid != nil {
                // Если логинился через почту, то сработает этот if
                let   vc1 = self.storyboard?.instantiateViewController(identifier: "MenuViewController") as! MenuViewController
                self.navigationController?.pushViewController(vc1, animated: true)
            } else if GIDSignIn.sharedInstance().hasPreviousSignIn() {
                // Если логинился через google то сработает этот if и вызовется метод didSignInFor который ниже. В нем отработает переход на следующий экран
                GIDSignIn.sharedInstance().delegate = self
                GIDSignIn.sharedInstance()?.restorePreviousSignIn()
            } else {
                // Если в первый два if не знаешло - значит не логинился
                let entryVC = self.storyboard?.instantiateViewController(identifier: "EntryViewController") as! EntryViewController
                self.navigationController?.pushViewController(entryVC, animated: true)
            }
            
            
        }
        
        
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if user != nil {
            let vc1 = self.storyboard?.instantiateViewController(identifier: "MenuViewController") as! MenuViewController
            self.navigationController?.pushViewController(vc1, animated: true)
        } else {
            let entryVC = self.storyboard?.instantiateViewController(identifier: "EntryViewController") as! EntryViewController
            self.navigationController?.pushViewController(entryVC, animated: true)
        }
    }
    
}
