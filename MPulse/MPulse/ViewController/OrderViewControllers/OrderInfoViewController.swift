//
//  OrderInfoViewController.swift
//  MPulse
//
//  Created by Nikita on 7/9/21.
//

import UIKit
import DTCircularActivityIndicator

class OrderInfoViewController: UIViewController {
    
    var activityIndicator: DTCircularActivityIndicator!
    
    @IBOutlet weak var viewOrder: UIView!
    
    var tokenResult: Token! 
    
    var phoneNumber: String = ""
    
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPhoneClient: UILabel!
    @IBOutlet weak var labelSerialNumber: UILabel!
    @IBOutlet weak var labelDeviceCondition: UILabel!
    
    @IBOutlet weak var labelOrderNumber: UILabel!
    
    @IBOutlet weak var labelModel: UILabel!
    
    @IBOutlet weak var labelClient: UILabel!
    
    @IBOutlet weak var labelMalfunctionOrder: UILabel!
    
    @IBOutlet weak var labelStatusOrder: UILabel!
    
    @IBOutlet weak var labelTypeDevice: UILabel!
    
    @IBOutlet weak var labelCostOrder: UILabel!
    
    @IBOutlet weak var labelTypeOrder: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        
        let activityWidth: CGFloat = 100
        let activityHeigth: CGFloat = 100
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        activityIndicator = DTCircularActivityIndicator(frame: CGRect.init(x: Int((screenWidth - activityWidth) / 2) , y: Int((screenHeight - activityHeigth) / 2) , width: 100, height: 100 ))
        
        view.addSubview(activityIndicator)
        activityIndicator.spinDuration = 0.5
        activityIndicator.lineWidth = 10.0
        activityIndicator.colors = [UIColor.black]
        
        
        let getToken = GetToken()
        getToken.downloadToken(onComplete: { [weak self] token in
            guard let self = self else {return}
            self.tokenResult = token
            
            self.activityIndicator.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) { [weak self] in
                guard let self = self else { return }
                self.activityIndicator.stopAnimating()
            }
            
            
            let order = StatusOrder()
            order.downLoadStatus(phoneNumber: self.phoneNumber, tokenParam: self.tokenResult, onComplete: { [weak self] orderr in
                guard let self = self else {return}
                if let orderr = orderr {
                    self.labelClient.text = orderr.client?.name
                    self.labelCostOrder.text = "\(String(orderr.price!)) руб."
                    self.labelMalfunctionOrder.text = orderr.malfunction
                    self.labelOrderNumber.text = String(describing: orderr.idOrder!)
                    self.labelTypeDevice.text = orderr.device?.typeDevice
                    self.labelModel.text = "\(String(describing: orderr.device!.brand!)) \(String(describing: orderr.device!.model!))"
                    self.labelTypeOrder.text = orderr.orderType?.name
                    self.labelStatusOrder.text = orderr.status?.name
                    self.labelDeviceCondition.text = orderr.device?.deviceCondition
                    self.labelSerialNumber.text = orderr.serial //?? "-"
                    
                    
                } else {
                    let alertVC = UIAlertController(title: "Ошибка!", message: "Неверный номер телефона!", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertVC.addAction(action)
                    self.present(alertVC, animated: true, completion: nil)
                }
            })
        })
        
    }
    
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        phoneNumber = ""
    }
    
    
}






