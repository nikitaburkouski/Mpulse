//
//  PriceXiaomiViewController.swift
//  MPulse
//
//  Created by Nikita on 7/22/21.
//

import UIKit

class PriceXiaomiViewController: UIViewController {
    
    var xiaomi: Xiaomi!
    
    @IBOutlet weak var labelLCD: UILabel!
    @IBOutlet weak var labelGlassRepaair: UILabel!
    @IBOutlet weak var labelAkb: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelLCD.text = xiaomi.lcd
        labelAkb.text = xiaomi.akb
        labelGlassRepaair.text = xiaomi.glassRepair
        
        
    }
    
    
    @IBAction func closeButoonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
