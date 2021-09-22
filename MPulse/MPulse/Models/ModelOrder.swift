//
//  Model.swift
//  MPulse
//
//  Created by Nikita on 8/12/21.
//

import Foundation

class Order {
    var status: Status?
    var client: Client?
    var malfunction: String?
    var price: Int?
    var device: Device?
    var idOrder: String?
    var orderType: OrderType?
    var serial: String?
    var operation: Operations?
    
}


class Status {
    var name: String?
}

class Client {
    var name: String?
    var phone: String?
}


class Device {
    var model: String?
    var brand: String?
    var typeDevice: String?
    var deviceCondition: String?
}

class OrderType {
    var name: String?
}

class Operations {
    var price: Int?
    var title: String?
}


