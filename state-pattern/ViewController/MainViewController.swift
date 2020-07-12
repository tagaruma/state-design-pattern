//
//  MainViewController.swift
//  state-pattern
//
//  Created by Ruslan Garifulin on 17.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, StateController {
    lazy var state: Statable = EmptyState(controller: self)
    lazy var user: User = User()

    private lazy var firstNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .gray
        label.text = "First Name"

        return label
    }()

    private lazy var firstNameTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .rgb(value: 240.0)
        textField.autocapitalizationType = .words
        textField.autocorrectionType = .no
        textField.layer.cornerRadius = 5.0
        textField.returnKeyType = .next
        textField.clipsToBounds = true
        textField.textColor = .black
        textField.delegate = self
        textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)

        return textField
    }()

    private lazy var lastNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .gray
        label.text = "Last Name"

        return label
    }()

    private lazy var lastNameTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .rgb(value: 240.0)
        textField.autocapitalizationType = .words
        textField.layer.cornerRadius = 5.0
        textField.autocorrectionType = .no
        textField.returnKeyType = .next
        textField.clipsToBounds = true
        textField.textColor = .black
        textField.delegate = self
        textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)

        return textField
    }()

    private lazy var emailLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .gray
        label.text = "Email"

        return label
    }()

    private lazy var emailTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .rgb(value: 240.0)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = 5.0
        textField.clipsToBounds = true
        textField.textColor = .black
        textField.delegate = self
        textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)

        return textField
    }()

    private lazy var passwordLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .gray
        label.text = "Password"

        return label
    }()

    private lazy var passwordTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .rgb(value: 240.0)
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = 5.0
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        textField.returnKeyType = .next
        textField.clipsToBounds = true
        textField.textColor = .black
        textField.delegate = self
        textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)

        return textField
    }()

    private lazy var phoneLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .gray
        label.text = "Phone Number"

        return label
    }()

    private lazy var phoneTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .rgb(value: 240.0)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.keyboardType = .phonePad
        textField.layer.cornerRadius = 5.0
        textField.clipsToBounds = true
        textField.textColor = .black
        textField.delegate = self
        textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)

        return textField
    }()

    private lazy var saveUserButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 17.0, weight: .semibold)
        button.backgroundColor = .rgb(red: 0.0, green: 117.0, blue: 255.0)
        button.setTitleColor(.gray, for: .highlighted)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Save User", for: .normal)
        button.layer.cornerRadius = 5.0
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(touchUpInside(saveUserButton:)), for: .touchUpInside)

        return button
    }()
}

// MARK: - Life Cycle

extension MainViewController {
    override func loadView() {
        super.loadView()

        setUpSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "State Design Pattern"
    }
}

// MARK: - Layout

extension MainViewController {
    private func setUpSubviews() {
        view.addSubview(firstNameLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameLabel)
        view.addSubview(lastNameTextField)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(phoneLabel)
        view.addSubview(phoneTextField)
        view.addSubview(saveUserButton)

        firstNameLabel.addAnchors(
            top: view.layoutGuide.topAnchor, topPadding: 10.0,
            leading: view.leadingAnchor, leadingPadding: 15.0
        )
        firstNameTextField.addAnchors(
            top: firstNameLabel.bottomAnchor, topPadding: 5.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0,
            height: 32.0
        )
        lastNameLabel.addAnchors(
            top: firstNameTextField.bottomAnchor, topPadding: 10.0,
            leading: view.leadingAnchor, leadingPadding: 15.0
        )
        lastNameTextField.addAnchors(
            top: lastNameLabel.bottomAnchor, topPadding: 5.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0,
            height: 32.0
        )
        emailLabel.addAnchors(
            top: lastNameTextField.bottomAnchor, topPadding: 10.0,
            leading: view.leadingAnchor, leadingPadding: 15.0
        )
        emailTextField.addAnchors(
            top: emailLabel.bottomAnchor, topPadding: 5.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0,
            height: 32.0
        )
        passwordLabel.addAnchors(
            top: emailTextField.bottomAnchor, topPadding: 10.0,
            leading: view.leadingAnchor, leadingPadding: 15.0
        )
        passwordTextField.addAnchors(
            top: passwordLabel.bottomAnchor, topPadding: 5.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0,
            height: 32.0
        )
        phoneLabel.addAnchors(
            top: passwordTextField.bottomAnchor, topPadding: 10.0,
            leading: view.leadingAnchor, leadingPadding: 15.0
        )
        phoneTextField.addAnchors(
            top: phoneLabel.bottomAnchor, topPadding: 5.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0,
            height: 32.0
        )
        saveUserButton.addAnchors(
            top: phoneTextField.bottomAnchor, topPadding: 15.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0,
            height: 40.0
        )
    }
}

// MARK: - UIButton

extension MainViewController {
    @objc private func touchUpInside(saveUserButton: UIButton) {
        saveUserButtonPressed()
    }
}

// MARK: - UITextField

extension MainViewController {
    @objc private func editingChanged(_ textField: UITextField) {
        switch textField {
        case firstNameTextField:
            user.firstName = textField.text
        case lastNameTextField:
            user.lastName = textField.text
        case emailTextField:
            user.email = textField.text
        case passwordTextField:
            user.password = textField.text
        case phoneTextField:
            user.phone = textField.text
        default:
            break
        }

        state.handleTextFieldValueChange()
    }
}

// MARK: - Actions

extension MainViewController {
    private func saveUserButtonPressed() {
        state.handleSaveUserButtonPress()
    }
}

// MARK: - StateController

extension MainViewController {
    func updateState(_ state: Statable) {
        self.state = state
    }

    func showMessage(with title: String, message: String) {
        showAlertController(with: title, message: message)
    }
}

// MARK: - UITextFieldDelegate

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstNameTextField:
            lastNameTextField.becomeFirstResponder()
        case lastNameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            phoneTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }

        return true
    }
}

// MARK: - UIAlertController

extension MainViewController {
    private func showAlertController(with title: String, message: String) {
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
