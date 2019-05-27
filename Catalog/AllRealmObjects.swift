//
//  AllRealmObjects.swift
//  Catalog
//
//  Created by Kishan on 5/27/19.
//  Copyright © 2019 Kishan. All rights reserved.
//

import Foundation
import RealmSwift

final class Frendo: Object {
    override static func primaryKey() -> String? {
        return "id"
    }
    
    var isRegistered: Bool?
    var fullName: String?
    var cellPhoneNumber: String?
    var instagramHandle: String?
    
}
