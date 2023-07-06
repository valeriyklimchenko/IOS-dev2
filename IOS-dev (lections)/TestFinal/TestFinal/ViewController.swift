//
//  ViewController.swift
//  TestFinal
//
//  Created by Shishkin Ivan Sergeevich on 03.03.2023.
//

import UIKit



final class ViewController: UIViewController {
    
    private var model: [Int] {
        var array = [Int]()
        for element in 0...20 {
            array.append(element)
        }
        return array
    }
    
    private let header = CustomHeader()
    
    private var initialImageRect: CGRect = .zero
    
    private let whiteView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        view.alpha = 0.7
        return view
    }()
    
    private lazy var crossButton: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 66, y: 80, width: 50, height: 50))
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(crossButtonAction), for: .touchUpInside)
        return button
    }()
    
    private let animatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    @objc private func crossButtonAction() {
        crossButton.removeFromSuperview()
        whiteView.removeFromSuperview()
        animateImageToInitial(rect: initialImageRect)
    }
    
    private func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func animateImageToInitial(rect: CGRect) {
        UIView.animate(withDuration: 0.6) {
            self.animatingImageView.frame = rect
            self.animatingImageView.layer.cornerRadius = 0
        } completion: { _ in
            self.animatingImageView.removeFromSuperview()
        }
    }
    
    private func animateImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(whiteView)
        view.addSubview(crossButton)
        view.addSubview(animatingImageView)
        animatingImageView.image = image
        animatingImageView.alpha = 1.0
        animatingImageView.frame = CGRect(x: imageFrame.origin.x,
                                          y: imageFrame.origin.y,
                                          width: imageFrame.width,
                                          height: imageFrame.height)
        
        UIView.animate(withDuration: 0.6) {
            self.animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.width)
            self.animatingImageView.center = self.view.center
            self.animatingImageView.layer.cornerRadius = UIScreen.main.bounds.width / 2
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        cell.delegate = self
        cell.setIndexPath(indexPath)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //подписываемся на делегата этого хедера
        header.delegate = self
        
        header.callBack = { _, _ in
            print("callBack")
        }
//        header.callBack = { [weak self] image, imageRect in
//            guard let self = self else { return }
//            let rect = self.header.frame
//            let currentHeaderRect = tableView.convert(rect, to: self.view)
//            self.initialImageRect = CGRect(x: imageRect.origin.x,
//                                      y: imageRect.origin.y + currentHeaderRect.origin.y,
//                                      width: imageRect.width,
//                                      height: imageRect.height)
//
//            self.animateImage(image, imageFrame: self.initialImageRect)
//        }
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shakeVC = ShakeVC()
        present(shakeVC, animated: true)
    }
}

// MARK: - CustomHeaderDelegate

extension ViewController: CustomHeaderDelegate {
    func didTapImage(_ image: UIImage?, imageRect: CGRect) {
        
        let rect = header.frame
        let currentHeaderRect = tableView.convert(rect, to: view)
        initialImageRect = CGRect(x: imageRect.origin.x,
                                  y: imageRect.origin.y + currentHeaderRect.origin.y,
                                  width: imageRect.width,
                                  height: imageRect.height)
        
        animateImage(image, imageFrame: initialImageRect)
    }
}

// MARK: - CustomCellDelegate

extension ViewController: CustomCellDelegate {
    func didTapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath) {
        let rectCell = tableView.rectForRow(at: indexPath)
        let rectInSuperView = tableView.convert(rectCell, to: tableView.superview)
        initialImageRect = CGRect(x: frameImage.origin.x,
                                  y: frameImage.origin.y + rectInSuperView.origin.y,
                                  width: frameImage.width,
                                  height: frameImage.height)
        
        animateImage(image, imageFrame: initialImageRect)
    }
}
