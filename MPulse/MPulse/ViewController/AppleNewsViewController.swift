//
//  ViewControllerAbout.swift
//  MPulse
//
//  Created by Nikita on 4/2/21.
//

import UIKit
import WebKit
import DTCircularActivityIndicator

class AppleNewsViewController: UIViewController, WKNavigationDelegate {
    
    var activityIndicator: DTCircularActivityIndicator = DTCircularActivityIndicator()
    
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        webView.allowsBackForwardNavigationGestures = true
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
        
        
        self.title = "Новости Apple"
        navigationController?.navigationBar.isHidden = false
        
        webView.load(URLRequest(url: URL( string: "https://wylsa.com/?s=apple")!))
        
        
    }
    
    func webView(_ webView: WKWebView , didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    
    @IBAction func back(_ sender: UIButton) {
        if (self.webView.canGoBack) {
            self.webView.goBack()
        }
    }
    
    @IBAction func forward(_ sender: UIButton) {
        if (self.webView.canGoForward) {
            self.webView.goForward()
        }
    }
    
    @IBAction func refresh(_ sender: UIButton) {
        if (self.webView.canGoForward) {
            self.webView.goForward()
        }
    }
}
