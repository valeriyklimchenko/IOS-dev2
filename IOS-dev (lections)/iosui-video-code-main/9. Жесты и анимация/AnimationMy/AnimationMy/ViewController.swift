//
//  ViewController.swift
//  AnimationMy
//
//  Created by Валерий Климченко on 29.06.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private var leadingRedView = NSLayoutConstraint()
    private var topRedView = NSLayoutConstraint()
    private var heightRedView = NSLayoutConstraint()
    private var widthRedView = NSLayoutConstraint()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        layout()
        setupGesture()
    }
    
    private func setupGesture() {
        //Дискретные жесты
//        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
//        swipeGesture.direction = .right  //по умолчанию так
//        swipeGesture.numberOfTouchesRequired = 1  //по умолчанию так
//        redView.addGestureRecognizer(swipeGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        redView.addGestureRecognizer(tapGesture)
        
        let longPressedGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressedAction))
        redView.addGestureRecognizer(longPressedGesture)
        
        //Прокрутка
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panAction))
//        redView.addGestureRecognizer(panGesture)
        
        //Масштабирование
//        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchAction))
//        redView.addGestureRecognizer(pinchGesture)
//        pinchGesture.delegate = self
//        //Поворот
//        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotationAction))
//        rotationGesture.delegate = self
//        redView.addGestureRecognizer(rotationGesture)
        
        //Прокрутка от края экрана
//        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edgeAction))
//        edgeGesture.edges = .right
//        view.addGestureRecognizer(edgeGesture)
    }

    @objc private func edgeAction() {
        self.view.backgroundColor = [UIColor.red, UIColor.cyan, UIColor.yellow, UIColor.white].randomElement()
    }
    
    @objc private func rotationAction(gesture: UIRotationGestureRecognizer) {
        redView.transform = redView.transform.rotated(by: gesture.rotation)
        gesture.rotation = 0
    }
    @objc private func pinchAction(gesture: UIPinchGestureRecognizer) {
        redView.transform = redView.transform.scaledBy(x: gesture.scale, y: gesture.scale)
        gesture.scale = 1
    }
    
    @objc private func panAction(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            let translation = gesture.translation(in: view)
            topRedView.constant += translation.y
            leadingRedView.constant += translation.x
            gesture.setTranslation(.zero, in: view)
        case .ended:
            UIView.animate(withDuration: 2) {
                self.topRedView.constant = 30
                self.leadingRedView.constant = 0
                self.view.layoutIfNeeded()
            }
        default:
            break
        }
        
    }
    
    @objc private func longPressedAction() {
        UIView.animateKeyframes(withDuration: 4, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.75) {
                self.topRedView.constant = 300
                self.leadingRedView.constant = 150
                self.widthRedView.constant = 999
                self.heightRedView.constant = 999
                self.view.layoutIfNeeded()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 1) {
                self.redView.layer.cornerRadius = 50
            }
        }
    }
    
    @objc private func tapAction() {
        //Анимация вращения
        let rotateAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
        rotateAnimation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = Float.pi //* 1.75
        //Анимация позиции
        let positionAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        positionAnimation.fromValue = redView.center
        positionAnimation.toValue = CGPoint(x: view.bounds.width - widthRedView.constant, y: redView.center.y)
        //создаем группу
        let groupAnimayion = CAAnimationGroup()
        groupAnimayion.duration = 2
        groupAnimayion.animations = [rotateAnimation, positionAnimation]
        //плавное начало и конец
        groupAnimayion.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        //к layer добавляем анимацию (CAAnimation анимирует layer)
        redView.layer.add(groupAnimayion, forKey: nil)
        //Указываем конечные значения (CABasicAnimation)
        redView.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi))
        redView.layer.position = CGPoint(x: view.bounds.width - widthRedView.constant, y: redView.center.y)
    }
    
    @objc private func swipeAction() {
        UIView.animate(withDuration: 4,
                       delay: 0.1,
                       usingSpringWithDamping: 0.8, //
                       initialSpringVelocity: 0.5, //начальная скорость пружины
                       options: .curveEaseInOut) { //что будет анимироваться
            self.leadingRedView.constant = UIScreen.main.bounds.width - self.widthRedView.constant
            self.topRedView.constant += 50
            self.view.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 1) {
                self.redView.layer.cornerRadius = self.widthRedView.constant/2
            }
        }
    }
    
    private func layout() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(redView)
        
        leadingRedView = redView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0)
        topRedView = redView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30)
        widthRedView = redView.widthAnchor.constraint(equalToConstant: 100)
        heightRedView = redView.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([leadingRedView, topRedView, heightRedView, widthRedView])
    }


}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
