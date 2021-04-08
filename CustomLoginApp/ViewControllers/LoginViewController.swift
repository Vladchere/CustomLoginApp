//
//  LoginViewController.swift
//  CustomLoginApp
//
//  Created by Vladislav on 01.04.2021.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

	// MARK: - IB Outlets
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var errorLabel: UILabel!

	// MARK: - Life cycle methods
	override func viewWillLayoutSubviews() {
		setUpElements()
	}

	// MARK: - IB Actions
	@IBAction func loginTapped(_ sender: Any) {
		// Validate text fields

		// Create cleaned version of the text field
		let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
		let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

		// Singing in the user
		Auth.auth().signIn(withEmail: email, password: password) { (result, error) in

			if error != nil {
				self.errorLabel.text = error!.localizedDescription
				self.errorLabel.alpha = 1
			} else {
				self.transitionToHome()
			}
		}
	}

	// MARK: - Private methods
	private func setUpElements() {
		// Hide the error label
		errorLabel.alpha = 0

		// Style the elements
		Utilities.styleTextField(emailTextField)
		Utilities.styleTextField(passwordTextField)
		Utilities.styleFilledButton(loginButton)
	}

	// MARK: - Navigation method
	private func transitionToHome() {
		let homeViewController = self.storyboard?.instantiateViewController(
			identifier: Constants.Storyboard.homeViewController
		) as? HomeViewController

		self.view.window?.rootViewController = homeViewController
		self.view.window?.makeKeyAndVisible()
	}
}
