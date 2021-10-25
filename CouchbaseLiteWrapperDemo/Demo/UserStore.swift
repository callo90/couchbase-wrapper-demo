//
//  UserStore.swift
//  CouchbaseLiteWrapperDemo
//
//  Created by Koombea on 7/29/21.
//

import Foundation
import CouchbaseLiteWrapper
import CouchbaseLiteSwift

struct UserStore {
    
    private static var couchbaseDatabase = CouchbaseDatabase(databaseName: "User")
    
    static func fetchUsers() -> [User] {
        return couchbaseDatabase.fetchAll(User.self)
    }
    
    static func saveUser(_ user: User) {
        let id = Int.random(in: 0..<1000)
        let document = CouchbaseDocument(id: "\(id)", attributes: user.toJSON())
        couchbaseDatabase.save(document)
    }
    
    static func deleteAll() {
        couchbaseDatabase.deleteAll()
    }
}
