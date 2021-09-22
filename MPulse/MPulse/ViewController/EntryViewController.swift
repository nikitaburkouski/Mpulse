//
//  EntryViewController.swift
//  MPulse
//
//  Created by Nikita on 5/9/21.
//

import UIKit
import Firebase
import DTCircularActivityIndicator
import GoogleSignIn



class EntryViewController: UIViewController, GIDSignInDelegate {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    var activityIndicator: DTCircularActivityIndicator = DTCircularActivityIndicator()
    
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var entryButton: UIButton!
    
    @IBOutlet weak var eyeButton: UIButton!
    
    @IBOutlet weak var registrationButton: UIButton!
    
    @IBOutlet weak var googleButton: UIButton!
    
    @IBOutlet weak var labelLogin: UILabel!
    
    @IBOutlet weak var labelPassword: UILabel!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var googleImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        GIDSignIn.sharedInstance()?.delegate = self
        
        UIView.animate(withDuration: 0.6) {
            self.loginTextField.frame.origin.x += 240
        }
        
        UIView.animate(withDuration: 0.5) {
            self.passwordTextField.frame.origin.x += 240
        }
        UIView.animate(withDuration: 0.7) {
            self.registrationButton.frame.origin.x += 240
        }
        UIView.animate(withDuration: 0.8) {
            self.entryButton.frame.origin.x += 240
        }
        UIView.animate(withDuration: 0.6) {
            self.labelLogin.frame.origin.x += 240
        }
        UIView.animate(withDuration: 0.6) {
            self.labelPassword.frame.origin.x += 240
        }
        UIView.animate(withDuration: 0.5) {
            self.logoImage.frame.origin.y += 20
        }
        UIView.animate(withDuration: 0.9) {
            self.googleButton.frame.origin.x += 240
        }
        UIView.animate(withDuration: 0.9) {
            self.googleImage.frame.origin.x += 240
        }
        UIView.animate(withDuration: 0.9) {
            self.eyeButton.frame.origin.x += 240
        }
        
        entryButton.modifyView()
        logoImage.modifyView()
        loginTextField.modifyView()
        passwordTextField.modifyView()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hide))
        view.addGestureRecognizer(tap)
        
        let activityWidth: CGFloat = 150
        let activityHeigth: CGFloat = 150
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        activityIndicator = DTCircularActivityIndicator(frame: CGRect.init(x: Int((screenWidth - activityWidth) / 2) , y: Int((screenHeight - activityHeigth) / 2) , width: 150, height: 150 ))
        
        view.addSubview(activityIndicator)
        activityIndicator.spinDuration = 0.7
        activityIndicator.lineWidth = 9.0
        activityIndicator.colors = [UIColor.systemBlue]
        
        passwordTextField.isSecureTextEntry = true
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    
    @IBAction func entryButtonClicked(_ sender: Any) {
        self.activityIndicator.startAnimating()
        if let email = loginTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if user != nil {
                    
                    let vc = self.storyboard?.instantiateViewController(identifier: "MenuViewController") as! MenuViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                    self.loginTextField.text = ""
                    self.passwordTextField.text = ""
                    self.activityIndicator.stopAnimating()
                    
                } else {
                    
                    let errorMessage = error?.localizedDescription ?? "Error"
                    let alertVC = UIAlertController(title: nil, message: errorMessage, preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertVC.addAction(action)
                    self.present(alertVC, animated: true, completion: nil)
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    
    
    @IBAction func registrationButtonClicked(_ sender: Any) {
        
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegistrationViewController")
        controller.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @IBAction func eyeButtonClicked(_ sender: Any) {
        
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    
    @IBAction func googleLogin(_ sender: Any) {
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
        
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if user != nil {
            
            let vc = self.storyboard?.instantiateViewController(identifier: "MenuViewController") as! MenuViewController
            self.navigationController?.pushViewController(vc, animated: true)
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
            
            
        } else {
            
            //  let errorMessage = error?.localizedDescription ?? "Error"
            let alertVC = UIAlertController(title: nil, message: "Вы не вошли в аккаунт!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
            
        }
    }
    
    @objc func hide() {
        view.endEditing(true)
    }
}


extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
}


