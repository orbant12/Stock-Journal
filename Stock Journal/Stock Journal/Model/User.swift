//
//  User.swift
//  Stock Journal
//
//  Created by Orbán Tamás on 2023. 07. 30..
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
    
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Kobe Bryant", email: "test@gmail.com")
}
