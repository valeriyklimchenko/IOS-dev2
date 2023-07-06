//
//  ViewController.swift
//  Final
//
//  Created by Валерий Климченко on 03.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: private
    private var initialImageRect: CGRect = .zero
    
    private let animatingImageView: UIImageView = {
       let view = UIImageView()
//        view.clipsToBounds = true
        return view
    }()
    
    private let whiteView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        view.layer.opacity = 0
//        view.alpha = 0.7
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 66, y: 80, width: 50, height: 50))
        button.backgroundColor = .black
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(closeAnimateImageAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        layout()
    }

    //MARK: - actions
    @objc private func closeAnimateImageAction() {
        closeButton.removeFromSuperview()
        whiteView.removeFromSuperview()
        closeImageAnimation(rect: initialImageRect)
    }
    
    
    //MARK: - animations
    private func animateImage(image: UIImage?, imageFrame: CGRect) {
        //добавляем анимируемые элементы
        [whiteView, closeButton, animatingImageView].forEach { view .addSubview($0) }
        
        //анимироваться будет картинка, которую мы передаем в функцию
        animatingImageView.image = image
        
        //изначальное положение анимируемой картинки совпадает с той, на которую мы тапнули
        self.animatingImageView.frame = CGRect(x: imageFrame.origin.x,
                                               y: imageFrame.origin.y,
                                               width: imageFrame.width,
                                               height: imageFrame.width)
        UIView.animate(withDuration: 1) {
            self.animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.width)
            self.animatingImageView.center = self.view.center
        }

    }
    
    private func closeImageAnimation(rect: CGRect) {
        UIView.animate(withDuration: 1) {
            self.animatingImageView.frame = CGRect(x: rect.origin.x,
                                                   y: rect.origin.y,
                                                   width: rect.width,
                                                   height: rect.height)
        } completion: { _ in
            self.animatingImageView.removeFromSuperview()
        }
    }
    

    //MARK: - private func
    private func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        //Подписываем ячейку под делегат, чтобы реализовать функцию через extention ViewController
        cell.delegate = self
        cell.setIndexPath(indexPath: indexPath)
        return cell
        
    }

}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
}

//MARK: - customCellDelegate
extension ViewController: customCellDelegate {
    func didTapImage(image: UIImage?, imageRect: CGRect, indexPath: IndexPath) {
        //узнаем фрейм ячейки
        let rect = tableView.rectForRow(at: indexPath)
        print(indexPath)
        //узнаем положение ячейки относительно superView
        let currentCellRect = tableView.convert(rect, to: tableView.superview)
//        print(currentCellRect)
        //записываем изеачальное положение картинки в ранее созданную переменную
        initialImageRect = CGRect(x: imageRect.origin.x,
                                  y: imageRect.origin.y + currentCellRect.origin.y,
                                  width: imageRect.width,
                                  height: imageRect.height)
        animateImage(image: image, imageFrame: initialImageRect)
    }
}
