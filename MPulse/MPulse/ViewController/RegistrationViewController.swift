//
//  RegistrationViewController.swift
//  MPulse
//
//  Created by Nikita on 5/9/21.
//

import UIKit
import Firebase
import DTCircularActivityIndicator

class RegistrationViewController: UIViewController {
    
    var activityIndicator: DTCircularActivityIndicator = DTCircularActivityIndicator()
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registrationButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hide))
        view.addGestureRecognizer(tap)
        
        loginTextField.modifyView()
        passwordTextField.modifyView()
        registrationButton.modifyView()
        
        UIView.animate(withDuration: 0.6) {
            self.registrationButton.frame.origin.x -= 240
        }
        UIView.animate(withDuration: 0.5) {
            self.loginTextField.frame.origin.x -= 240
        }
        UIView.animate(withDuration: 0.4) {
            self.passwordTextField.frame.origin.x -= 240
        }
        
        let activityWidth: CGFloat = 150
        let activityHeigth: CGFloat = 150
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        activityIndicator = DTCircularActivityIndicator(frame: CGRect.init(x: Int((screenWidth - activityWidth) / 2) , y: Int((screenHeight - activityHeigth) / 2) , width: 150, height: 150))
        
        view.addSubview(activityIndicator)
        activityIndicator.spinDuration = 0.7
        activityIndicator.lineWidth = 10.0
        activityIndicator.colors = [UIColor.systemBlue]
        
    }
    
    @IBAction func registrationButtonClicked(_ sender: Any) {
        
        if let email = loginTextField.text, let password = passwordTextField.text {
            self.activityIndicator.startAnimating()
            
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if user != nil {
                    let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! MenuViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                    self.activityIndicator.stopAnimating()
                    
                } else {
                    let errorMessage = error?.localizedDescription ?? "Error"
                    let alertVC = UIAlertController(title: nil, message: errorMessage, preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                    alertVC.addAction(action)
                    self.present(alertVC, animated: true, completion: nil)
                    self.activityIndicator.stopAnimating()
                    
                }
            }
        }
    }
    
    
    @objc func hide() {
        view.endEditing(true)
    }
}
