//
//  PriceHuaweiViewController.swift
//  MPulse
//
//  Created by Nikita on 7/22/21.
//

import UIKit

class PriceHuaweiViewController: UIViewController {

    var huawei: Huawei!
    
    @IBOutlet weak var labelLCD: UILabel!
    @IBOutlet weak var labelGlassRepair: UILabel!
    @IBOutlet weak var labelAkb: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelLCD.text = huawei.lcd
        labelGlassRepair.text = huawei.glassRepair
        labelAkb.text = huawei.akb

    }
    
    @IBAction func closedButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

    

}
