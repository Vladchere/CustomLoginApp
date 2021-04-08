//
//  ViewController.swift
//  CustomLoginApp
//
//  Created by Vladislav on 01.04.2021.
//

import UIKit
import AVKit

class MainViewController: UIViewController {

	// MARK: - IB Outlets
	@IBOutlet weak var signUpButton: UIButton!
	@IBOutlet weak var loginButton: UIButton!

	// MARK: - Private property
	private var videoPlayer: AVPlayer?
	private var videoplayerLayer: AVPlayerLayer?

	// MARK: - Life cycle methods
	override func viewDidLoad() {
		super.viewDidLoad()
		setNavigationBarStyle()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: animated)

		setUpVideo()
	}

	override func viewWillLayoutSubviews() {
		setUpElements()
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.setNavigationBarHidden(false, animated: animated)
	}

	// MARK: - Private methods
	private func setUpElements() {
		Utilities.styleFilledButton(signUpButton)
		Utilities.styleHollowButton(loginButton)
	}

	private func setUpVideo() {
		// Get the path to the resource in the bundle
		let bundelPath = Bundle.main.path(forResource: "loginbg", ofType: "mp4")
		guard bundelPath != nil else { return }

		// Create a URL from it
		let url = URL(fileURLWithPath: bundelPath!)

		// Create the video player item
		let item = AVPlayerItem(url: url)

		// Create the player
		videoPlayer = AVPlayer(playerItem: item)

		// Create the layer
		videoplayerLayer = AVPlayerLayer(player: videoPlayer!)

		// Adjust the size and frame
		videoplayerLayer?.frame = CGRect(
			x: -self.view.frame.size.width*1.5,
			y: 0,
			width: self.view.frame.size.width*4,
			height: self.view.frame.size.height
		)
		view.layer.insertSublayer(videoplayerLayer!, at: 0)

		// Add it to the view and play it
		videoPlayer?.playImmediately(atRate: 0.3)
	}

	private func setNavigationBarStyle() {
		let backItem = UIBarButtonItem()
		backItem.title = "Main screen"
		navigationItem.backBarButtonItem = backItem
	}
}

