//
//  PriceAndroidViewController.swift
//  MPulse
//
//  Created by Nikita on 7/12/21.
//

import UIKit

class PriceSamsungViewController: UIViewController {
    
    var samsung: Samsung!
    
    @IBOutlet weak var labelLCD: UILabel!
    @IBOutlet weak var labelGlassRepair: UILabel!
    @IBOutlet weak var labelAkb: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelLCD.text = samsung.lcd
        labelAkb.text = samsung.akb
        labelGlassRepair.text = samsung.glassRepair
        
    }
    
    
    @IBAction func closedButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
}
