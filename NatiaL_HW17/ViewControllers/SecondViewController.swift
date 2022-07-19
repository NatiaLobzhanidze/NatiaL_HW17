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
    
    var startingWidth: CGFloat!
    
    var startingheight: CGFloat!
    
    var longgesture = UILongPressGestureRecognizer()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        startingWidth = self.myImage.frame.size.width
        startingheight = self.myImage.frame.size.height
        setUpGestures()
    }
    
    func setUpGestures(){
        switch moveId {
        case 1,2:
            addLongPress()
        case 3,4:
            setupSwipeGesture()
        default:
            addLongPress()
        }
    }
}



