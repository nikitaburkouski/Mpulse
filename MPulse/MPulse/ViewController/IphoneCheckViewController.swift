//
//  IphoneCheckViewController.swift
//  MPulse
//
//  Created by Nikita on 9/4/21.
//

import UIKit
import WebKit
import DTCircularActivityIndicator


class IphoneCheckViewController: UIViewController, WKNavigationDelegate {
    
    var activityIndicator: DTCircularActivityIndicator = DTCircularActivityIndicator()
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        webView.load(URLRequest(url: URL( string: "https://ifreeicloud.co.uk/free-check")!))
        
        let activityWidth: CGFloat = 150
        let activityHeigth: CGFloat = 150
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        activityIndicator = DTCircularActivityIndicator(frame: CGRect.init(x: Int((screenWidth - activityWidth) / 2) , y: Int((screenHeight - activityHeigth) / 2) , width: 150, height: 150))
        
        view.addSubview(activityIndicator)
        activityIndicator.spinDuration = 0.7
        activityIndicator.lineWidth = 10.0
        activityIndicator.colors = [UIColor.systemBlue]
        
        activityIndicator.startAnimating()
        
        self.title = "Проверка по серийному номеру"
        
    }
    
    func webView(_ webView: WKWebView , didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
}
//hkjhkhhhkkkj
