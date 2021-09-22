//
//  TestKeyboardViewController.swift
//  MPulse
//
//  Created by Nikita on 6/19/21.
//

import UIKit

class TestKeyboardViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var imageLogo: UIImageView!
    
    @IBOutlet weak var constraintView: NSLayoutConstraint!
    
    
    var offsetBeforeKeyboardDidShown: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        // Do any additional setup after loading the view.
    }
    

    func textFieldDidBeginEditing(_ textField: UITextField) {

        let frameInView = passwordTextField.convert(passwordTextField.frame, to: view)
        
        let screenHeight = UIScreen.main.bounds.size.height
        let keyboardHeight: CGFloat = 216
        let offset = (screenHeight - keyboardHeight) - (frameInView.height + frameInView.origin.y)
        if offset < 0 {
            scrollView.contentOffset.y = offset * (-1)
        }
    }
    
    @objc func keyboardDidShow(_ notification: Notification) {
    
        offsetBeforeKeyboardDidShown = scrollView.contentOffset.y
        
    }
    @objc func keyboardDidHide(_ notification: Notification) {
        
    }

}
