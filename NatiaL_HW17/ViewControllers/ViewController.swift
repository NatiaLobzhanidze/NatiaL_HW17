//
//  ViewController.swift
//  NatiaL_HW17
//
//  Created by Natia's Mac on 19.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var redCircle: UIImageView!
    @IBOutlet weak var blueCircle: UIImageView!
    
    @IBOutlet weak var purpleTriangle: UIImageView!
    @IBOutlet weak var blackTriangle: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTap()
        NotificationCenter.default.addObserver(self, selector: #selector(changeBckgrndColor), name: Notification.Name("ChangeColor"), object: nil)
    }
    
    @objc func changeBckgrndColor(notification: Notification) {
        guard let color = notification.userInfo?["backgroundColor"] as? UIColor else { return }
            view.backgroundColor = color
    }
  
}

