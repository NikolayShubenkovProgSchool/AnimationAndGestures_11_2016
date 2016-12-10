//
//  HandleStaloneViewController.swift
//  AnimationAndGestures
//
//  Created by Nikolay Shubenkov on 10/12/2016.
//  Copyright © 2016 Nikolay Shubenkov. All rights reserved.
//

import UIKit

class HandleStaloneViewController: UIViewController {

    @IBOutlet var topSpaceToStalone: NSLayoutConstraint!
    
    @IBOutlet var leftSpaceToStalone: NSLayoutConstraint!

    @IBAction func changeBackgroundGesture(_ sender: UITapGestureRecognizer)
    {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.randColor()
        })
    }
    
    @IBAction func translationGesture(_ gesture: UIPanGestureRecognizer)
    {
        switch gesture.state
        {
        case .changed,.ended:
            
            let translation = gesture.translation(in: view)
            
            UIView.animate(withDuration: 0.1, animations: { 
                
                self.topSpaceToStalone.constant += translation.y
                self.leftSpaceToStalone.constant += translation.x
                self.view.layoutIfNeeded()
            })
            
            gesture.setTranslation(CGPoint(), in: view)
            
            
        default: break
        }
        
    }
    
    
}
