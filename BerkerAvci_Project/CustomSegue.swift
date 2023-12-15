//
//  CustomSegue.swift
//  BerkerAvci_Project
//
//  Created by Berker Avcı on 9.06.2023.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    override func perform() {
            // Add your custom implementation here
            // For example, you can perform a custom animation or transition
            
            // Example: Perform a custom transition using UIView.transition
            UIView.transition(
                from: source.view,
                to: destination.view,
                duration: 0.5,
                options: .transitionFlipFromBottom,
                completion: nil
                
            )
        }
}
