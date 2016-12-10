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
    
    private let movingView = UIView(frame: CGRect(x: -50, y: 150, width: 50, height: 50))
    
    
    //настало время настроить наш контроллер
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - UIEvents

    @IBAction func moveLotOfViews(_ sender: UIButton) {
        
        //Создадим новый вью
        //зададим ему цвет фона
        //переместим его вправо
        //удалим с экрана
        
        for _ in 0 ... 40 {
        
            let coloredView = UIView()
            coloredView.backgroundColor = UIColor.blue
            view.addSubview(coloredView)
            
            let size:CGFloat = CGFloat( arc4random_uniform(40)) + 20
            
            let yPosition:CGFloat = 100 + CGFloat( arc4random_uniform(350))
            let color = UIColor.yellow
            let duration = 1 + 0.5 * ( TimeInterval( arc4random_uniform(100)) ) / 100
            let delay = 1 * ( TimeInterval( arc4random_uniform(100)) ) / 100
            
            coloredView.frame = CGRect(x: -size, y: yPosition, width: size, height: size)
            
            UIView.animate(withDuration: duration,
                           delay: delay,
                           options: [.curveLinear, .autoreverse, .repeat],
                           animations: {
            
                            coloredView.center.x += self.view.frame.width + size
                            coloredView.backgroundColor = color
            },
                           completion: { animationFinished in
                            coloredView.removeFromSuperview()
            })
        }
    }
    
    @IBAction func roateButtonPressed(_ sender: UIButton)
    {
        //На самом можно у UIView можно анимировать
        //цвет фона - bakcgroundColor
        //положение - frame либо как-то менять constraints
        //прозрачность
        //transform - особое свойство, задающее матрицу трансофрмации нашего вью
        
        let rotateView = UIView(frame: CGRect(x: 50, y: 250, width: 100, height: 100))
        
        func randomValue()->Float
        {
            let randomColorComponent = Float(arc4random_uniform(100)) / 100.0
            return Float(randomColorComponent)
        }
        
        rotateView.backgroundColor = UIColor(colorLiteralRed: randomValue(),
            green: randomValue(),
            blue: randomValue(),
            alpha: 1)
        
        
        view.addSubview(rotateView)
        
        //Keyframed animation
        //анимация, выполняемая в несолько этапов/шагов
        
        UIView.animateKeyframes(withDuration: 2,
                                delay: 0,
                                options: .calculationModeLinear,
                                animations: {
        
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 1.0/3.0,
                                                       animations: { 
                                                        rotateView.transform = rotateView.transform.rotated(by: CGFloat(M_PI * 2.0 / 3.0))
                                    })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 1.0/3.0,
                                                       relativeDuration: 1.0/3.0,
                                                       animations: {
                                                        rotateView.transform = rotateView.transform.rotated(by: CGFloat(M_PI * 2.0 / 3.0))
                                    })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 2.0/3.0,
                                                       relativeDuration: 1.0/3.0,
                                                       animations: {
                                                        rotateView.transform = rotateView.transform.rotated(by: CGFloat(M_PI * 2.0 / 3.0))
                                    })
                                    
                                    
        },
                                completion: nil)
        
        
        
    }
    
    
    func animationButton1Pressed(btn:UIButton)
    {
        let animationDuration = 1.0
        
        let viewToAdd = redView.superview    == nil ? redView : blueView
        let viewToRemove = redView.superview != nil ? redView : blueView
        
        btn.isEnabled = false
        
        // анимация добавления и изьятия вью на каком-то другом вью
        UIView.transition(with: container,//на ком будет отображаться анимация
                          duration: animationDuration,
                          options: [.transitionFlipFromLeft],
                          animations: {
                            
                            viewToRemove.removeFromSuperview()
                            self.container.addSubview(viewToAdd)
        },
                          //finished - отвечает за то, закончена ли была анимация
                          //либо ее прервали
                          completion: { finished in
                            
                            print("animation finished \(finished)")
                            btn.isEnabled = true
        })
    }
    
    @IBAction func animteMoving(_ sender: UIButton)
    {
    
        let options:UIViewAnimationOptions = [UIViewAnimationOptions.autoreverse, UIViewAnimationOptions.repeat]
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: options,
                       animations: {
                        self.movingView.center.x += self.view.frame.size.width + 50
                        self.movingView.backgroundColor = UIColor.cyan
        },
                       completion: { finished in
        
                        print("animation finished")
        })
    
    }
    
    private func setupViews()
    {
        setupContainer()
        
        setupMovingView()
        setupRedView()
        setupBlueView()
        setupAnimationButton()
    }
    
    private func setupMovingView()
    {
        movingView.backgroundColor = UIColor.purple
        view.addSubview(movingView)
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
