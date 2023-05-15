//
//  ViewController.swift
//  AnimationAndGesture
//
//  Created by Shishkin Ivan Sergeevich on 26.04.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private var leadingRedView = NSLayoutConstraint()
    private var topRedView = NSLayoutConstraint()
    private var widthRedView = NSLayoutConstraint()
    private var heightRedView = NSLayoutConstraint()
    
    private enum AnimationState {
        case leftState
        case rightState
    }
    
    private var animationState: AnimationState = .leftState
    private var animator = UIViewPropertyAnimator(duration: 1.0, timingParameters: UISpringTimingParameters(
        mass: 2.0,
        stiffness: 30.0,
        damping: 7.0,
        initialVelocity: .zero))

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setupGesture()
    }
    
    private func setupGesture() {
        // Дискретный жесты
//        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
//        swipeGesture.direction = .left
//        redView.addGestureRecognizer(swipeGesture)
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
//        redView.addGestureRecognizer(tapGesture)
        
//        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longAction))
//        longGesture.minimumPressDuration = 2.0
//        redView.addGestureRecognizer(longGesture)
        
        // Непрерывные жесты
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panAction))
//        redView.addGestureRecognizer(panGesture)
        
//        let pinGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinAction))
//        pinGesture.delegate = self
//        redView.addGestureRecognizer(pinGesture)
//
//        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotationAction))
//        rotationGesture.delegate = self
//        redView.addGestureRecognizer(rotationGesture)
        
        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edgeAction))
        edgeGesture.edges = .right
        view.addGestureRecognizer(edgeGesture)
    }
    
    @objc private func edgeAction() {
        self.view.backgroundColor = [UIColor.yellow, UIColor.cyan, UIColor.black, UIColor.green].randomElement()
    }
    
    @objc private func rotationAction(gesture: UIRotationGestureRecognizer) {
        redView.transform = redView.transform.rotated(by: gesture.rotation)
        gesture.rotation = 0
    }
    
    @objc private func pinAction(gesture: UIPinchGestureRecognizer) {
        redView.transform = redView.transform.scaledBy(x: gesture.scale, y: gesture.scale)
        gesture.scale = 1
    }
    
    @objc private func panAction(gesture: UIPanGestureRecognizer) {
//        switch gesture.state {
//        case .changed:
//            let translation = gesture.translation(in: view)
//            print(translation)
//            topRedView.constant += translation.y
//            leadingRedView.constant += translation.x
//            gesture.setTranslation(.zero, in: view)
//
//        case .ended:
//            print("finish")
//            UIView.animate(withDuration: 2.0) {
//                self.leadingRedView.constant = 0
//                self.topRedView.constant = 30
//                self.view.layoutIfNeeded()
//            }
//
//        default:
//            break
//        }
        
        let translation = gesture.translation(in: view)
        
        switch gesture.state {
        case .began:
            switch animationState {
            case .leftState:
                animator.addAnimations {
                    self.redView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5).rotated(by: .pi)
                    self.redView.center = CGPoint(
                        x: self.redView.center.x + 250,
                        y: self.redView.center.y)
                }
                animator.startAnimation()
                animator.pauseAnimation()
                print("began left state")
            case .rightState:
                animator.addAnimations {
                    self.redView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75).rotated(by: .pi / 180)
                    self.redView.center = CGPoint(
                        x: self.redView.center.x - 250,
                        y: self.redView.center.y)
                }
                animator.startAnimation()
                animator.pauseAnimation()
                print("began right state")
            }
            
        case .changed:
            switch animationState {
            case .leftState:
                animator.fractionComplete = translation.x / view.bounds.size.width
                print("changed left state")
            case .rightState:
                animator.fractionComplete = -translation.x / view.bounds.size.width
                print("changed right state")
            }
            
        case .ended:
            switch animationState {
            case .leftState:
                if (redView.layer.presentation()?.position.x)! < view.center.x {
                    animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                    animator.isReversed = true
                    print("ended left state")
                } else {
                    animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                    print("ended left state")
                    animationState = .rightState
                }
            case .rightState:
                if (redView.layer.presentation()?.position.x)! > view.center.x {
                    animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                    animator.isReversed = true
                    print("ended if rigrtState")
                } else {
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                    print("ended else rigrtState")
                    animationState = .leftState
                }
            }
            
        default:
            break
        }
    }
    
    @objc private func longAction() {
        UIView.animateKeyframes(withDuration: 4.0, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.75) {
                self.topRedView.constant = 250
                self.leadingRedView.constant = 150
                self.view.layoutIfNeeded()
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 1.0) {
                self.redView.layer.cornerRadius = 50
            }
        }
    }

    @objc private func tapAction() {
        let rotateAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
        rotateAnimation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = Float.pi * 1.75
        
        let positionAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        positionAnimation.fromValue = redView.center
        positionAnimation.toValue = CGPoint(x: view.bounds.width - 100, y: redView.center.y)
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 2.0
        groupAnimation.animations = [rotateAnimation, positionAnimation]
        groupAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        redView.layer.add(groupAnimation, forKey: nil)
        redView.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi * 1.75))
        redView.layer.position = CGPoint(x: view.bounds.width - 100, y: redView.center.y)
    }
    
    @objc private func swipeAction() {
        UIView.animate(withDuration: 4.0,
                       delay: 1.0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.3,
                       options: .curveEaseInOut) {
            self.leadingRedView.constant = UIScreen.main.bounds.width - self.widthRedView.constant
            self.topRedView.constant += 50
            self.view.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 1.0) {
                self.redView.layer.cornerRadius = 50
            }
        }

    }
    
    private func layout() {
        view.addSubview(redView)
        
        leadingRedView = redView.leadingAnchor.constraint(equalTo: view.leadingAnchorNme)
        topRedView = redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        widthRedView = redView.widthAnchor.constraint(equalToConstant: 100)
        heightRedView = redView.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([leadingRedView, topRedView, widthRedView, heightRedView])
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
