//
//  ValidState.swift
//  state-pattern
//
//  Created by Ruslan Garifulin on 19.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import Foundation

class ValidState: Statable {
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
            if !email.isValidEmail || !phone.isValidPhone {
                controller.updateState(InvalidState(controller: controller))
            }
        } else {
            controller.updateState(EmptyState(controller: controller))
        }
    }

    func handleSaveUserButtonPress() {
        getUsers { [weak self] users in
            guard let self = self else { return }

            if users.contains(self.controller.user) {
                self.controller.updateState(AlreadyExistsState(controller: self.controller))
                self.controller.state.handleSaveUserButtonPress()
            } else {
                var users = users
                users.append(self.controller.user)

                if let encoded = try? JSONEncoder().encode(users) {
                    UserDefaults.standard.set(encoded, forKey: "Users")
                    self.controller.showMessage(
                        with: "Success",
                        message: """
                        User with the following info has been successfully saved:
                        Name: \(self.controller.user.firstName!) \(self.controller.user.lastName!)
                        Email: \(self.controller.user.email!)
                        Phone: \(self.controller.user.phone!)
                        """
                    )
                }
            }
        }
    }

    private func getUsers(_ completion: @escaping ([User]) -> ()) {
        if let data = UserDefaults.standard.value(forKey: "Users") as? Data {
            if let users = try? JSONDecoder().decode([User].self, from: data) {
                completion(users)
            } else {
                completion([])
            }
        } else {
            completion([])
        }
    }
}
