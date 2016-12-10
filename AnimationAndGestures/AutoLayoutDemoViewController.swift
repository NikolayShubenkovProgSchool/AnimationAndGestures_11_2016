//
//  AutoLayoutDemoViewController.swift
//  AnimationAndGestures
//
//  Created by Nikolay Shubenkov on 10/12/2016.
//  Copyright © 2016 Nikolay Shubenkov. All rights reserved.
//

import UIKit

class AutoLayoutDemoViewController: UIViewController {

    @IBOutlet var textToShow: UILabel!
    @IBOutlet var textContainer: UIView!
    @IBOutlet var topSpace: NSLayoutConstraint!
    
    @IBAction func animateWithAutoLayout(_ sender: UIButton)
    {
        
        var text = "Use this method to force the layout of subviews before drawing. Using the view that receives the message as the root view, this method lays out the view subtree starting at the root."
        
        for _ in 0 ... arc4random_uniform(4) {
            text += "\n\nUse this method to force the layout of subviews before drawing. Using the view that receives the message as the root view, this method lays out the view subtree starting at the root."
        }
        
        UIView.animate(withDuration: 0.8,
                       animations: {
                        self.textContainer.backgroundColor = UIColor.randColor()
                        self.textToShow.textColor = UIColor.randColor()
                        
                        self.textToShow.text = text
                        
                        self.topSpace.constant = CGFloat(arc4random_uniform(300)) + 50
                        
                        //заставит систему пересчитать положения всех вью
                        //в соответствии с ограничениями, которые могли поменяться
                        self.view.layoutIfNeeded()
        })
            
    }
    
    

    

}
