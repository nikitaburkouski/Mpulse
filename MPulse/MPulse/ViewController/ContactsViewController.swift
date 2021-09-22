//
//  ViewControllerContacts.swift
//  MPulse
//
//  Created by Nikita on 4/3/21.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var instagramButton: UIButton!
    
    
    
    @IBAction func instagramButton(_ sender: Any) {
        if let url = URL(string: "https://www.instagram.com/mpulse.by/?hl=ru") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBOutlet weak var googleMapsButton: UIButton!
    @IBAction func googleMapsButton(_ sender: Any) {
        if let url2 = URL(string: "https://goo.gl/maps/mcR9qy6bNwrZRsGS8") {
            UIApplication.shared.open(url2, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBOutlet weak var siteButton: UIButton!
    @IBAction func siteButton(_ sender: Any) {
        if let url3 = URL(string: "https://mpulse.by") {
            UIApplication.shared.open(url3, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBOutlet weak var telegramButton: UIButton!
    @IBAction func telegramButton(_ sender: Any) {
        if let url4 = URL(string: "https://t.me/m_pulse") {
            UIApplication.shared.open(url4, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBAction func phoneButtonClicked(_ sender: Any) {
        
        
        if let url = URL(string: "tel://+375296693000") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
    }
    
    override func viewDidLoad() {
        
        navigationController?.navigationBar.isHidden = false
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UIView.animate(withDuration: 0.7) {
            self.instagramButton.frame.origin.x += 290
        }
        
        UIView.animate(withDuration: 0.9) {
            self.googleMapsButton.frame.origin.x += 200
        }
        
        UIView.animate(withDuration: 1) {
            self.siteButton.frame.origin.x += 100
        }
        
        UIView.animate(withDuration: 0.7) {
            self.telegramButton.frame.origin.x += 360
        }
        
        UIView.animate(withDuration: 0.8) {
            self.contactLabel.frame.origin.y += 670
        }
        
        UIView.animate(withDuration: 0.8) {
            self.logoImage.frame.origin.x -= 290
        }
        
        telegramButton.modifyView()
        logoImage.modifyView()
        contactLabel.modifyView()
        instagramButton.modifyView()
        siteButton.modifyView()
        googleMapsButton.modifyView()
        
    }
    
}

