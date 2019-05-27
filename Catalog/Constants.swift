//
//  Constants.swift
//  Catalog
//
//  Created by Kishan on 5/11/19.
//  Copyright © 2019 Kishan. All rights reserved.
//

import Foundation

struct Constants {
    static let REALM_INSTANCE = "catalog.us1.cloud.realm.io"
    
    static let AUTH_URL  = URL(string: "https://\(REALM_INSTANCE)")!
    static let REALM_URL = URL(string: "realms://\(REALM_INSTANCE)/Catalog")!
}
