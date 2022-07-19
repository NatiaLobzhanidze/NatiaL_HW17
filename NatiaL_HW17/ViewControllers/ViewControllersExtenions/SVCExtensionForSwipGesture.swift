//
//  SecondViewControllerExt_Swipe.swift
//  NatiaL_HW17
//
//  Created by Natia's Mac on 19.07.22.
//

import Foundation
import UIKit


// Triangle Gestures

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
        
        switch gesture.direction {
        case .right:
            print(myImage.frame.size.width )
            UIView.animate(withDuration: 0.2, delay: 0.0, options:[], animations: {  [self] in
                self.myImage.transform =  myImage.transform.scaledBy(x: 1.25, y: 1)
            }, completion: nil)
            
        case .left:
            UIView.animate(withDuration: 0.2, delay: 0.0, options:[], animations: { [self] in
                self.myImage.transform =  myImage.transform.scaledBy(x: -1.25, y: 1)
            }, completion: nil)
            
        case .up:
            UIView.animate(withDuration: 0.2, delay: 0.0, options:[], animations: { [self] in
                self.myImage.transform =  myImage.transform.scaledBy(x: 1, y: 1.25)
            }, completion: nil)
        case .down:
            UIView.animate(withDuration: 0.2, delay: 0.0, options:[], animations: { [self] in
                self.myImage.transform =  myImage.transform.scaledBy(x: 1, y: -1.25)
            }, completion: nil)
        default:
            self.myImage.transform =  myImage.transform.scaledBy(x: 1, y: -1.25)        }
        if moveId == 4 {
            checkFrame()
        }
    }
}

extension SecondViewController {
    // შევამოწმოთ სურათის frame თუ მეტია view bounds
    
    func checkFrame(){
        let imageMaxX = self.myImage.frame.size.width - CGFloat(30)
        let imageMaxY = self.myImage.frame.size.height
        if UIScreen.main.bounds.width <= imageMaxX || UIScreen.main.bounds.height <= imageMaxY {
            print("outside scene")
            print(UIScreen.main.bounds.width )
            print(imageMaxX)
            self.myImage.frame.size.width = startingWidth
            self.myImage.frame.size.height = startingheight
            self.myImage.center = self.view.center
            
        }
    }
}
