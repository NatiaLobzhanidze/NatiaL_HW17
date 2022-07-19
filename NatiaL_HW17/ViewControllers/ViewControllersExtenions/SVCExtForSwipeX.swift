//
//  SVCExtForSwipeX.swift
//  NatiaL_HW17
//
//  Created by Natia's Mac on 19.07.22.
//

import Foundation
import UIKit
// Circle Gestures
extension SecondViewController {
    func setupSwipeGesture() {
        myImage.addGestureRecognizer(getDirectionSwipe(with: .right))
        myImage.addGestureRecognizer(getDirectionSwipe(with: .down))
        myImage.addGestureRecognizer(getDirectionSwipe(with: .left))
        myImage.addGestureRecognizer(getDirectionSwipe(with:.up))
    }
    
    func getDirectionSwipe (with direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer{
        let rightSwipeGesture = UISwipeGestureRecognizer(
            target: self,
            action: #selector(handleSwipeGesture(_:))
        )
        
        rightSwipeGesture.direction =  direction
        return rightSwipeGesture
    }
    
    @objc  func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        
    let xNumb = CGFloat(50)
        
        switch gesture.direction {
        case .right:
            animateImageMove(on: xNumb, y: 0)
            
        case .left:
            animateImageMove(on: -(xNumb), y: 0)
            
        case .up:
            animateImageMove(on: 0 , y: -xNumb)
        case .down:
            animateImageMove(on: 0, y: xNumb)
        default:
            self.myImage.transform = self.myImage.transform.translatedBy(x: 0, y: 0)  }
        if moveId == 4 {
            checkFrame()
        }
    }
    
    func animateImageMove(on x: CGFloat, y: CGFloat) {
        UIView.animate(withDuration: 0.2, delay: 0.0, options:[], animations: {  [self] in
            self.myImage.transform = self.myImage.transform.translatedBy(x: x, y: y)
    })
                       }
}

extension SecondViewController {
    // შევამოწმოთ სურათის frame თუ მეტია view bounds
    
    func checkFrame(){
        let imageMaxX = self.myImage.frame.maxX
        let imageMinX = self.myImage.frame.minX
        
        
        let imageMaxY = self.myImage.frame.maxY
        let imageMinY = self.myImage.frame.minY
        
        if UIScreen.main.bounds.width <= imageMaxX || imageMinX <= 0 || UIScreen.main.bounds.height <= imageMaxY || imageMinY <= 0{
            print("outside scene")
            self.myImage.frame.origin.x = startingX
            self.myImage.frame.origin.y = startingY
            
        }
    }
}


