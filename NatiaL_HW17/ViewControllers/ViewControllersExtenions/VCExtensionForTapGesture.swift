//
//  VCExtensionForTapGesture.swift
//  NatiaL_HW17
//
//  Created by Natia's Mac on 19.07.22.
//

import Foundation
import UIKit

extension ViewController {
    func addTap() {
        
        let tapGestureOnRed = UITapGestureRecognizer(target: self, action: #selector(moveToNextPage))
        let tapGestureOnBlue = UITapGestureRecognizer(target: self, action: #selector(moveToNextPage))
        let tapPurpleTriangle = UITapGestureRecognizer(target: self, action: #selector(moveToNextPage))
        let tapBlackTriangle = UITapGestureRecognizer(target: self, action: #selector(moveToNextPage))
        redCircle.addGestureRecognizer(tapGestureOnRed)
        blueCircle.addGestureRecognizer(tapGestureOnBlue)
        purpleTriangle.addGestureRecognizer(tapPurpleTriangle)
        blackTriangle.addGestureRecognizer(tapBlackTriangle)
    }
    
    @objc func moveToNextPage(gesture: UITapGestureRecognizer){
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController, let imageTag = gesture.view?.tag else { return }
        vc.moveId = imageTag
        print(imageTag)
        navigationController?.pushViewController(vc, animated: true)
    }
}

