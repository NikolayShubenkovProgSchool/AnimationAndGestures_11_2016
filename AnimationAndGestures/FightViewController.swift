//
//  FightViewController.swift
//  AnimationAndGestures
//
//  Created by Nikolay Shubenkov on 10/12/2016.
//  Copyright © 2016 Nikolay Shubenkov. All rights reserved.
//

import UIKit

class FightViewController: UIViewController {

    @IBOutlet var hero1: UIImageView!
    @IBOutlet var hero2: UIImageView!
    
    
    @IBAction func fight(_ sender: UIButton)
    {
        //реализовать код,
        //который с равной вероятностью будет 
        //записывать в hero1Winse  
        //true или false
        let hero1Wins = arc4random_uniform(2) % 2 == 0
        print("heor 1 wins? \(hero1Wins)")
        
        let hero1Value:UILayoutPriority = hero1Wins ? 900 : 100
        let hero2Value:UILayoutPriority = hero1Wins ? 100 : 900
        
        let duration = 2.5
        let delay = 0.0
        let options = UIViewAnimationOptions.curveEaseInOut
        
        //степень колебаний. 0 - 1. 1 - анимация завершиться без колебания
        //чем ближе к 0, тем больше будет колебаний
        let damping = 0.25
        //относительная скорость анимации.
        //если например мы меняем позицию вью, от 0 до 100
        //в таком случае, начальная скорость будет равна 100 точкам в секунду
        let velocity = 3.5
        
        UIView.animate(withDuration: duration,
                       delay: delay,
                       usingSpringWithDamping: CGFloat(damping),
                       initialSpringVelocity: CGFloat(velocity),
                       options: options,
                       animations: {
                        //установим ссопростивление на сжатие и растяжение по вертикали у разынх вью
                        self.hero1.setContentHuggingPriority(hero1Value, for: .vertical)
                        self.hero1.setContentCompressionResistancePriority(hero1Value, for: .vertical)
                        
                        self.hero2.setContentCompressionResistancePriority(hero2Value, for: .vertical)
                        self.hero2.setContentHuggingPriority(hero2Value, for: .vertical)
                        
                        self.view.backgroundColor = UIColor.randColor()
                        
                        self.view.layoutIfNeeded()
        },
                       completion: nil)
        

        
    }
}
