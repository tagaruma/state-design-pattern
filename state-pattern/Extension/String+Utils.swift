//
//  String+Utils.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 17.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)

        return predicate.evaluate(with: self)
    }
    
    var isValidPhone: Bool {
        let regex = "[+0-9]{7,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)

        return predicate.evaluate(with: self)
    }
}
