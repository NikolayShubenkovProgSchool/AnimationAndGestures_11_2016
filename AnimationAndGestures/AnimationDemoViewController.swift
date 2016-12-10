//
//  AnimationDemoViewController.swift
//  AnimationAndGestures
//
//  Created by Nikolay Shubenkov on 10/12/2016.
//  Copyright © 2016 Nikolay Shubenkov. All rights reserved.
//

import UIKit

class AnimationDemoViewController: UIViewController {

    private let container = UIView()
    private let redView = UIView()
    private let blueView = UIView()
    private let animationButton1 = UIButton()
    
    //настало время настроить наш контроллер
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - UIEvents

    func animationButton1Pressed(btn:UIButton)
    {
        let animationDuration = 1.0
        UIView.animate(withDuration: animationDuration,
                       animations: {
                        //тут мы пишем все, что хотим санимировать
                        self.view.backgroundColor = UIColor.yellow
                        self.container.center.y += 20
        })
    }
    
    private func setupViews()
    {
        setupContainer()
        setupRedView()
        setupBlueView()
        setupAnimationButton()
    }
    
    private func setupAnimationButton()
    {
        //зададим положение кнопки
        animationButton1.frame = CGRect(origin: CGPoint(), size: CGSize(width: 200, height: 40))
        animationButton1.center = CGPoint(x:160,y:300)
        
        //добавим на кнопку действие
        animationButton1.addTarget(self,
                                   action: #selector(AnimationDemoViewController.animationButton1Pressed(btn:)),
                                   for: .touchUpInside)
        
        //укажем текст и цвет заголовка
        animationButton1.setTitle("Поехали", for: .normal)
        animationButton1.setTitleColor(UIColor.black, for: .normal)
        
        //чуть не забыл добавить кнопку на вью
        view.addSubview(animationButton1)
    }
    
    private func setupBlueView()
    {
        blueView.frame = CGRect(origin: CGPoint(),
                                size: container.frame.size)
        blueView.backgroundColor = UIColor.blue
    }
    
    private func setupRedView()
    {
        //задали размеры красного вью
        redView.frame = CGRect(origin: CGPoint(),
                               size: container.frame.size)
        
        //сделали красный вью действительно красным
        redView.backgroundColor = UIColor.red
        
        //добавили красный вью на контейнер
        container.addSubview(redView)
    }
    
    private func setupContainer()
    {
        container.frame = CGRect(origin: CGPoint(x:60,y:60),
                                 size: CGSize(width: 200, height: 200))
        view.addSubview(container)
    }
    
    
}
