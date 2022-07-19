//
//  SecondViewController.swift
//  NatiaL_HW17
//
//  Created by Natia's Mac on 19.07.22.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    
    var moveId = 0
    
    var startingX: CGFloat!
    
    var startingY: CGFloat!
    
    var longgesture = UILongPressGestureRecognizer()
    let colorsArray = [UIColor.brown, UIColor.yellow, UIColor.green, UIColor.cyan]
    override func viewDidLoad() {
        
        super.viewDidLoad()
        startingX = self.myImage.frame.origin.x
        startingY = self.myImage.frame.origin.y
        setUpGestures()
        
    }
    
    func setUpGestures(){
        switch moveId {
        case 1,2:
            addLongPress()
        case 3:
            setupSwipeGesture()
        case 4:
            setupSwipeGesture()
            NotificationCenter.default.post(name: Notification.Name("ChangeColor"), object: nil, userInfo: ["backgroundColor" : colorsArray.randomElement() ?? UIColor.red ])
        default:
            addLongPress()
        }
    }
}



