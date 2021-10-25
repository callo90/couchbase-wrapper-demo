//
//  User.swift
//  CouchbaseLiteWrapperDemo
//
//  Created by Koombea on 7/29/21.
//

import Foundation
import ObjectMapper

struct User: Mappable {
    
    var id: Int?
    var firstName: String?
    var lastName: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        firstName <- map["first_name"]
        lastName <- map["last_name"]
    }

}
