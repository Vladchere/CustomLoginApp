//
//  ViewController.swift
//  CustomLoginApp
//
//  Created by Vladislav on 01.04.2021.
//

import UIKit
import AVKit

class MainViewController: UIViewController {

	var videoPlayer: AVPlayer?
	var videoplayerLayer: AVPlayerLayer?

	@IBOutlet weak var signUpButton: UIButton!
	@IBOutlet weak var loginButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {
		// Set up video in the background
		setUpVideo()
	}

	override func viewWillLayoutSubviews() {
		setUpElements()
	}

	func setUpElements() {
		Utilities.styleFilledButton(signUpButton)
		Utilities.styleHollowButton(loginButton)
	}

	func setUpVideo() {
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
}

