//
//  ViewController.swift
//  MPulse
//
//  Created by Nikita on 4/1/21.
//

import UIKit
import GoogleSignIn
import Firebase


class MenuViewController: UIViewController {
    
    
    // let entryVC: EntryViewController = EntryViewController()
    
    @IBOutlet weak var searchOrder: UIButton!
    @IBAction func searchOrder(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "CheckOrderViewController") as! CheckOrderViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBOutlet weak var searchCostButtonClicked: UIButton!
    @IBAction func searchCost(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "TabBarController") as! UITabBarController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet weak var iphoneTrackerButtonClicked: UIButton!
    @IBAction func catalogTech(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "IphoneTrackeViewController") as! IphoneTrackerViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBOutlet weak var iphoneCheckButtonClicked: UIButton!
    @IBAction func newsButton(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "IphoneCheckViewController") as! IphoneCheckViewController
        
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBOutlet weak var contactsButton: UIButton!
    @IBAction func contactsButton(_ sender: Any) {
        
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewControllerContacts")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @IBOutlet weak var appleNewsButtonClicked: UIButton!
    @IBAction func aboutButton(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "AppleNewsViewController") as! AppleNewsViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backgroundColor = .gray
        
        searchOrder.layer.cornerRadius = 20
        searchCostButtonClicked.layer.cornerRadius = 20
        iphoneTrackerButtonClicked.layer.cornerRadius = 20
        iphoneCheckButtonClicked.layer.cornerRadius = 20
        contactsButton.layer.cornerRadius = 20
        appleNewsButtonClicked.layer.cornerRadius = 20
        
        
        UIView.animate(withDuration: 1) {
            self.appleNewsButtonClicked.frame.origin.x += 240
        }
        UIView.animate(withDuration: 0.8) {
            self.contactsButton.frame.origin.x += 240
        }
        UIView.animate(withDuration: 0.7) {
            self.iphoneCheckButtonClicked.frame.origin.x += 240
            
        }
        
        UIView.animate(withDuration: 0.5) {
            self.iphoneTrackerButtonClicked.frame.origin.x += 240
        }
        
        UIView.animate(withDuration: 0.4) {
            self.searchCostButtonClicked.frame.origin.x += 240
        }
        
        UIView.animate(withDuration: 0.3) {
            self.searchOrder.frame.origin.x += 240
        }
        
        iphoneCheckButtonClicked.modifyView()
        searchCostButtonClicked.modifyView()
        contactsButton.modifyView()
        appleNewsButtonClicked.modifyView()
        iphoneTrackerButtonClicked.modifyView()
        searchOrder.modifyView()
        
        navigationItem.hidesBackButton = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Выйти", style: .done, target: self, action: #selector(singOut))
        
        
    }
    
    @objc func singOut() {
        GIDSignIn.sharedInstance()?.signOut()
        do  {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        let vc = storyboard?.instantiateViewController(identifier: "EntryViewController") as! EntryViewController
        navigationController?.pushViewController(vc, animated: true)
        navigationController?.navigationBar.isHidden = true
        
        
    }
}

extension UIView {
    func modifyView() {
        
        self.layer.shadowRadius = 15.0
        self.layer.shadowColor = UIColor.systemBlue.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
    }
}
