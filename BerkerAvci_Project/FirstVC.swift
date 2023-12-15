//
//  ViewController.swift
//  BerkerAvci_Project
//
//  Created by Berker Avcı on 9.06.2023.
//

import UIKit
import CoreGraphics
import AVFoundation

class FirstVC: UIViewController {
    var audioPlayer: AVAudioPlayer!
    
    
    func setGradientBackground() {        // Create a CAGradientLayer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        // Define the gradient colors
        gradientLayer.colors = [UIColor.brown.cgColor, UIColor.orange.cgColor]
        
        // Set the gradient direction
        gradientLayer.startPoint = CGPoint(x: 0.6, y: 0.7)
        gradientLayer.endPoint = CGPoint(x: 0.2, y: 0.3)
        
        // Add the gradient layer to the view's layer
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @objc func handleSwipeUp(_ gestureRecognizer: UISwipeGestureRecognizer) {
            if gestureRecognizer.state == .recognized {
                performSegue(withIdentifier: "CustomSegue", sender: self)
            }
        }
    func playsound(){
        let soundURL = Bundle.main.url(forResource: "sound2", withExtension: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!)
        
        audioPlayer.play()
    }
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        playsound()
        setGradientBackground()
        let swipeUpGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeUp(_:)))
                swipeUpGestureRecognizer.direction = .up
                // Add the gesture recognizer to the view
                view.addGestureRecognizer(swipeUpGestureRecognizer)
        // Do any additional setup after loading the view.
        
        
    }


}

