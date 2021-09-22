//
//  StatusOrder.swift
//  MPulse
//
//  Created by Nikita on 8/12/21.
//

import Foundation

import Alamofire


class StatusOrder {
    //5f5a4ef02d0a631cfc4c65ca9807785d975b691b
    
    var baseUrl =  "https://api.remonline.ru"
    
    
    func downLoadStatus(phoneNumber: String, tokenParam: Token, onComplete: ((Order?)  -> Void)?) {
        let url = "\(baseUrl)/order/?token=\(tokenParam.token!)&client_phones[]=\(phoneNumber)"
        
        
        //            let url = "\(baseUrl)/statuses/?token=\(tokenParam.token!)&key1=\()&key2=\()"
        
        AF.request(url).responseJSON (completionHandler: {response in
            if let dictionary = response.value as? [String: Any] {
                if let array = dictionary["data"] as? [[String: Any]] {
                    if array.count > 0 {
                        if let orderDictionary = array[0] as? [String: Any] {
                            if let order = orderDictionary["id"] as? Int {
                                var order1 = Order()
                                order1.malfunction = orderDictionary["malfunction"] as? String
                                order1.price = orderDictionary["price"] as? Int
                                order1.idOrder = orderDictionary["id_label"] as? String
                                order1.serial = orderDictionary["serial"] as? String
                                
                                if let clientDictionary = orderDictionary["client"] as? [String: Any] {
                                    var client = Client()
                                    client.name = clientDictionary["name"] as? String
                                    
                                    
                                    
                                    if let statusDictionary = orderDictionary["status"] as? [String: Any] {
                                        var status = Status()
                                        status.name = statusDictionary["name"] as? String
                                        
                                        if let deviceDictionary = orderDictionary["custom_fields"] as? [String: Any] {
                                            var device = Device()
                                            device.brand = deviceDictionary["f780084"] as? String
                                            device.model = deviceDictionary["f780075"] as? String
                                            device.typeDevice = deviceDictionary["f780088"] as? String
                                            device.deviceCondition = deviceDictionary["f780086"] as? String
                                            
                                            if let orderTyprDictionary = orderDictionary["order_type"] as? [String: Any] {
                                                var orderType = OrderType()
                                                orderType.name = orderTyprDictionary["name"] as? String
                                                
                                                
                                                if let dict = response.value as? [String: Any] {
                                                    if let array1 = dict["operations"] as? [[String: Any]] {
                                                        if let operationDict = array1[0] as? [String: Any] {
                                                            var operation = Operations()
                                                            operation.price = operationDict["price"] as? Int
                                                            operation.title = operationDict["title"] as? String
                                                            
                                                            order1.operation = operation
                                                            
                                                        }
                                                    }
                                                }
                                                
                                                
                                                order1.orderType = orderType
                                            }
                                            
                                            order1.device = device
                                        }
                                        
                                        order1.client = client
                                        order1.status = status
                                        //     order1.orderType = orderType
                                        
                                        onComplete?(order1)
                                        
                                        print(url)
                                        
                                    }
                                    
                                }
                                
                            }
                        }
                    } else {
                        onComplete?(nil)
                    }
                    
                }
            } else if let error = response.error {
                print(">>> error: \(error.localizedDescription)")
            }
            
            
            
            
        })
        
    
    }
    
}
