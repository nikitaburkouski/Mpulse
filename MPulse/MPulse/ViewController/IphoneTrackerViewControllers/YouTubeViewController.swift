//
//  YouTubeViewController.swift
//  MPulse
//
//  Created by Nikita on 9/7/21.
//

import UIKit
import WebKit
import DTCircularActivityIndicator


class YouTubeViewController: UIViewController, WKNavigationDelegate {
    
    var iphones: IPhoneModel!
    
    var activityIndicator: DTCircularActivityIndicator = DTCircularActivityIndicator()
    
    @IBOutlet weak var youTubeWebView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        youTubeWebView.navigationDelegate = self
        
        youTubeWebView.load(URLRequest(url: URL(string: iphones!.youtubeUrl)!))
        
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
        
        
    }
    
    func webView(_ webView: WKWebView , didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
}
