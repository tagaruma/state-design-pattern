//
//  EmptyState.swift
//  state-pattern
//
//  Created by Ruslan Garifulin on 19.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import Foundation

class EmptyState: Statable {
    var controller: StateController

    init(controller: StateController) {
        self.controller = controller
    }

    func handleTextFieldValueChange() {
        let user = controller.user

        if let firstName = user.firstName,
            !firstName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            let lastName = user.lastName,
            !lastName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            let email = user.email,
            !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            let password = user.password,
            !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            let phone = user.phone,
            !phone.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            controller.updateState(InvalidState(controller: controller))
        }
    }

    func handleSaveUserButtonPress() {
        controller.showMessage(with: "Oops", message: "User cannot be saved unless all fields are filled in")
    }
}
