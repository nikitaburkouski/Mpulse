//
//  PriceXGenerationViewController.swift
//  MPulse
//
//  Created by Nikita on 6/7/21.
//

import UIKit

class PriceXGenerationViewController: UIViewController {
    
    var phone: IphonePrice?
    
    @IBOutlet weak var labelLCD: UILabel!
    @IBOutlet weak var labelGlassRepair: UILabel!
    @IBOutlet weak var labelAkb: UILabel!
    @IBOutlet weak var labelBuzzer: UILabel!
    @IBOutlet weak var labelButtonOn: UILabel!
    @IBOutlet weak var labelCharge: UILabel!
    @IBOutlet weak var labelFrontCamera: UILabel!
    @IBOutlet weak var labelCamera: UILabel!
    
    @IBOutlet weak var priceLCD: UILabel!
    
    @IBOutlet weak var priceRepairGlass: UILabel!
    
    @IBOutlet weak var priceAKB: UILabel!
    
    @IBOutlet weak var priceBuzzer: UILabel!
    
    @IBOutlet weak var priceButtonOn: UILabel!
    
    @IBOutlet weak var priceCharge: UILabel!
    
    @IBOutlet weak var priceFrontCamera: UILabel!
    
    @IBOutlet weak var priceCamera: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        priceLCD.text = phone?.lcd
        priceAKB.text = phone?.akb
        priceBuzzer.text = phone?.buzzer
        priceRepairGlass.text = phone?.home
        priceButtonOn.text = phone?.buttonOn
        priceCharge.text = phone?.charge
        priceFrontCamera.text = phone?.frontCamera
        priceCamera.text = phone?.camera
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
}
