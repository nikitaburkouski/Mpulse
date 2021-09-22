//
//  ViewControllerPrice.swift
//  MPulse
//
//  Created by Nikita on 4/21/21.
//

import UIKit

class PriceViewController: UIViewController {
    
    var phone: IphonePrice?
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    
    @IBOutlet weak var labelLCD: UILabel!
    @IBOutlet weak var labelAkb: UILabel!
    
    @IBOutlet weak var labelBuzzer: UILabel!
    
    @IBOutlet weak var labelHome: UILabel!
    
    @IBOutlet weak var labelButtonOn: UILabel!
    
    @IBOutlet weak var labelCharge: UILabel!
    
    @IBOutlet weak var labelFrontCamera: UILabel!
    
    @IBOutlet weak var labelCamera: UILabel!
    
    @IBOutlet weak var priceLCD: UILabel!
    @IBOutlet weak var priceAKB: UILabel!
    
    @IBOutlet weak var priceBuzzer: UILabel!
    
    @IBOutlet weak var priceHomeButton: UILabel!
    
    @IBOutlet weak var priceOnButton: UILabel!
    
    @IBOutlet weak var priceCharge: UILabel!
    
    @IBOutlet weak var priceFrontCamera: UILabel!
    
    
    @IBOutlet weak var priceCamera: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        
        label!.layer.cornerRadius = 15
        label2!.layer.cornerRadius = 15
        label3!.layer.cornerRadius = 15
        label4!.layer.cornerRadius = 15
        label5!.layer.cornerRadius = 15
        label6!.layer.cornerRadius = 15
        label7!.layer.cornerRadius = 15
        label8!.layer.cornerRadius = 15
        
   
        
        
        priceLCD.text = phone?.lcd
        priceAKB.text = phone?.akb
        priceBuzzer.text = phone?.buzzer
        priceHomeButton.text = phone?.home
        priceOnButton.text = phone?.buttonOn
        priceCharge.text = phone?.charge
        priceFrontCamera.text = phone?.frontCamera
        priceCamera.text = phone?.camera
        
        
    }
    
    
    @IBAction func buttonBackClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
