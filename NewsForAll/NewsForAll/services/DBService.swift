//
//  DBService.swift
//  newsforall
//
//  Created by user on 16/12/19.
//  Copyright © 2019 MIHCM. All rights reserved.
//

import Foundation

protocol CRUD {
    func save() -> Any?
    static func find() -> Any?
}
