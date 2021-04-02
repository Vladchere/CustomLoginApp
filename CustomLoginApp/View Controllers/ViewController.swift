//
//  ViewController.swift
//  CustomLoginApp
//
//  Created by Vladislav on 01.04.2021.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var signUpButton: UIButton!
	@IBOutlet weak var loginButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewWillLayoutSubviews() {
		setUpElements()
	}

	func setUpElements() {
		Utilities.styleFilledButton(signUpButton)
		Utilities.styleHollowButton(loginButton)
	}
}

