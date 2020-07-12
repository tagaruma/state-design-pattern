//
//  StateController.swift
//  state-pattern
//
//  Created by Ruslan Garifulin on 19.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import Foundation

protocol StateController {
    var state: Statable { get set }
    var user: User { get set }

    func updateState(_ state: Statable)
    func showMessage(with title: String, message: String)
}
