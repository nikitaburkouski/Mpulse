//
//  OrderInfoViewController.swift
//  MPulse
//
//  Created by Nikita on 7/8/21.
//

import UIKit
import DTCircularActivityIndicator


class CheckOrderViewController: UIViewController  {
    
    var activityIndicator2: DTCircularActivityIndicator!
    
    @IBOutlet weak var numberPhoneTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        
        let activityWidth: CGFloat = 150
        let activityHeigth: CGFloat = 150
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        activityIndicator2 = DTCircularActivityIndicator(frame: CGRect.init(x: Int((screenWidth - activityWidth) / 2) , y: Int((screenHeight - activityHeigth) / 2) , width: 150, height: 150 ))
        
        activityIndicator2.spinDuration = 1.0
        activityIndicator2.lineWidth = 9.0
        activityIndicator2.colors = [UIColor.systemBlue]
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hide))
        view.addGestureRecognizer(tap)
        
        numberPhoneTextField.keyboardType = .numberPad
        
        self.title = "Статус заказа"
        
    }
    
    @IBAction func checkOrderButtonClicked(_ sender: Any) {
        
        let orderInfoVc = self.storyboard?.instantiateViewController(identifier: "OrderInfoViewController") as! OrderInfoViewController
        orderInfoVc.phoneNumber = self.numberPhoneTextField.text ?? ""
        
        if numberPhoneTextField.text == "375" || numberPhoneTextField.text == "" {
            
            let alertVC = UIAlertController(title: "Ошибка!", message: "Введите номер телефона!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
            
        } else {
            self.present(orderInfoVc, animated: true, completion: nil)
            
        }
    }
    
    
    @objc func hide() {
        view.endEditing(true)
    }
}
