//
//  DownloadToken.swift
//  MPulse
//
//  Created by Nikita on 8/12/21.
//

import Foundation
import Alamofire

class GetToken {
    
    var apiKey = "ad03513aa64540a2a73ef2f8f407dc5e"
    var baseUrl =  "https://api.remonline.ru"
    
    func downloadToken(onComplete: ((Token) -> Void)?) {
        let url = "\(baseUrl)/token/new"
        AF.request(url, parameters: ["api_key": apiKey]).responseJSON(completionHandler: { response in
            if let token1 = response.value as? [String: Any] {
                var token = Token()
                token.token = token1["token"] as? String
                onComplete?(token)
                
            }
        })
        
    }
}



