//
//  Statable.swift
//  state-pattern
//
//  Created by Ruslan Garifulin on 19.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import UIKit

protocol Statable {
    var controller: StateController { get }

    func handleTextFieldValueChange()
    func handleSaveUserButtonPress()
}
