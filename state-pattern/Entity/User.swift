//
//  User.swift
//  state-pattern
//
//  Created by Ruslan Garifulin on 17.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import Foundation

struct User: Codable, Equatable {
    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    var phone: String?
}
