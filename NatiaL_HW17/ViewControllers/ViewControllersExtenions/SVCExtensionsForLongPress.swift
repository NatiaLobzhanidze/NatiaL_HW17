//
//  SVCExtensionsForLongPress.swift
//  NatiaL_HW17
//
//  Created by Natia's Mac on 19.07.22.
//

import Foundation
import UIKit
// Circle Gestures

extension SecondViewController {
    
    func addLongPress() {
        longgesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        if moveId == 1 {
            longgesture.minimumPressDuration = 0.5
        } else if moveId == 2 {
            longgesture.minimumPressDuration = 1.1
        }
        myImage.addGestureRecognizer(longgesture)
    }
    
    @objc func longPress(gesture: UIGestureRecognizer){
        if moveId == 1 {
            navigationController?.popToRootViewController(animated: true)
        } else if moveId == 2 {
            setView(image: myImage, hidden: true)
        }
    }
    
    func setView(image: UIImageView, hidden: Bool) {
        UIImageView.animate(withDuration: 0.7,
                            delay: 0.5 ,
                            options: .curveEaseIn,
                            animations: {
            image.alpha = 0
        })}
    
}
