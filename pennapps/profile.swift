//
//  profile.swift
//  pennapps
//
//  Created by Jothi Ramaswamy on 9/8/18.
//  Copyright © 2018 Jothi Ramaswamy. All rights reserved.
//

import Foundation

struct Profile {
    var name: String!
    var phone: String!
    var address: String!
    var city: String!
    var state: String!
    var zip: String!
    var email: String!
    var emName: String!
    var emPhone: String!
    var medName: String!
    var medPhone: String!
    var medEmail: String!
    
    init(name: String!, phone: String!, address: String!, city: String!, state: String!, zip: String!, email: String!, emName: String!, emPhone: String!, medName: String!, medPhone: String!, medEmail: String!) {
        self.name = name
        self.phone = phone
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.email = email
        self.emName = emName
        self.emPhone = emPhone
        self.medName = medName
        self.medPhone = medPhone
        self.medEmail = medEmail
    }
    
    init() {
        self.name = ""
        self.phone = ""
        self.address = ""
        self.city = ""
        self.state = ""
        self.zip = ""
        self.email = ""
        self.emName = ""
        self.emPhone = ""
        self.medName = ""
        self.medPhone = ""
        self.medEmail = ""
    }
    
    
    
}
