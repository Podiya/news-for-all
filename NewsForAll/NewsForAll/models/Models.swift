//
//  Models.swift
//  newsforall
//
//  Created by user on 16/12/19.
//  Copyright © 2019 MIHCM. All rights reserved.
//

import Foundation


struct User: CRUD {
    
    static let defaults = Defaults()
    var userName: String
    
    func save() {
        User.defaults["username"] = userName
    }

    static func find() -> Any? {
        guard let userName = User.defaults["username"] else { return nil }
        return User(userName: userName as! String)
    }
}
