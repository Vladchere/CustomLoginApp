//
//  LoginViewController.swift
//  CustomLoginApp
//
//  Created by Vladislav on 01.04.2021.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

	@IBOutlet weak var firstNameTextField: UITextField!
	@IBOutlet weak var lastNameTextField: UITextField!
	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var errorLabel: UILabel!


	override func viewDidLoad() {
        super.viewDidLoad()
	}

	override func viewWillLayoutSubviews() {
		setUpElements()
	}

	func setUpElements() {
		// Hide the error label
		errorLabel.alpha = 0

		// Style the elements
		Utilities.styleTextField(firstNameTextField)
		Utilities.styleTextField(lastNameTextField)
		Utilities.styleFilledButton(loginButton)
	}

	@IBAction func loginTapped(_ sender: Any) {
		// Validate text fields

		// Create cleaned version of the text field

		// Singing in the user
		Auth.auth().signIn(withEmail: <#T##String#>, password: <#T##String#>, completion: <#T##((AuthDataResult?, Error?) -> Void)?##((AuthDataResult?, Error?) -> Void)?##(AuthDataResult?, Error?) -> Void#>)

	}
}
