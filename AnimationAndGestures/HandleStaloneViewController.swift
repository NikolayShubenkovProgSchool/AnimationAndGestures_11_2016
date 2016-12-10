//
//  HandleStaloneViewController.swift
//  AnimationAndGestures
//
//  Created by Nikolay Shubenkov on 10/12/2016.
//  Copyright © 2016 Nikolay Shubenkov. All rights reserved.
//

import UIKit

class HandleStaloneViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet var stalone: UIImageView!
    @IBOutlet var staloneWidth: NSLayoutConstraint!
    @IBOutlet var topSpaceToStalone: NSLayoutConstraint!
    
    @IBOutlet var leftSpaceToStalone: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRotateGesture()
    }
    
    private func setupRotateGesture()
    {
        let rotation = UIRotationGestureRecognizer(target: self,
                                                   action: #selector(HandleStaloneViewController.rotateGesture(_:)))
        rotation.delegate = self
        stalone.addGestureRecognizer(rotation)
    }
    
    //MARK: - UIGestureRecognizer Delegate
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool
    {
        return true
    }
    
    //MARK: - UI Events
    
    func rotateGesture(_ gesture:UIRotationGestureRecognizer)
    {
        UIView.animate(withDuration: 0.1,
                       animations:{
                        switch gesture.state
                        {
                        case .ended, .changed:
                            self.stalone.transform = self.stalone.transform.rotated(by: gesture.rotation)
                            gesture.rotation = 0
                            
                        default:
                            break
                        }
        })
    }
    
    @IBAction func changeBackgroundGesture(_ sender: UITapGestureRecognizer)
    {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.randColor()
        })
    }
    
    @IBAction func scaleGesture(_ gesture: UIPinchGestureRecognizer)
    {
        switch gesture.state
        {
        case .ended,.changed:
            let scale = gesture.scale
            
            UIView.animate(withDuration: 0.1, animations: { 
                self.staloneWidth.constant *= scale
                self.view.layoutIfNeeded()
            })
            gesture.scale = 1
            
        default:
            break
        }
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
