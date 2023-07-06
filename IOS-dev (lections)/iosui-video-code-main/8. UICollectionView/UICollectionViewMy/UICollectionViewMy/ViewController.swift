//
//  ViewController.swift
//  UICollectionViewMy
//
//  Created by Валерий Климченко on 14.06.2023.
//

import UIKit

class ViewController1: UIViewController {
    
    //MARK: Model
    private var array: [Int] {
        var array = [Int]()
        for i in 0...999 {
            array.append(i)
        }
        return array
    }
    
    private var array2: [Int] {
        var array = [Int]()
        for i in 0...11 {
            array.append(i)
        }
        return array
    }
    
    //MARK: UI
    private lazy var verticalCollectionView = makeCollectionView(scrollDirection: .vertical)
    private lazy var horizontalCollectionView = makeCollectionView(scrollDirection: .horizontal)
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .white
//        setupCollections()
//        verticalCollectionView.reloadData()
    }
    
//    private func setupCollections() {
//        verticalCollectionView.dataSource = self
//        verticalCollectionView.delegate = self
//
//        horizontalCollectionView.dataSource = self
//        horizontalCollectionView.delegate = self
//
//        verticalCollectionView.reloadData()
//        horizontalCollectionView.reloadData()
//    }
    
    //MARK: private metods
    private func layout() {
        view.addSubview(verticalCollectionView)
        view.addSubview(horizontalCollectionView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            verticalCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            verticalCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            verticalCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            verticalCollectionView.heightAnchor.constraint(equalToConstant: 500),
            
            horizontalCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            horizontalCollectionView.topAnchor.constraint(equalTo: verticalCollectionView.bottomAnchor, constant: 30),
            horizontalCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
//            horizontalCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
            horizontalCollectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

//MARK: UICollectionViewDataSource
//Количество ячеек в секции
extension ViewController1: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case verticalCollectionView:
            return array.count
        case horizontalCollectionView:
            return array2.count
        default:
            return 0
        }
    }
    
    //создание ячейки
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.setupCell()
        return cell
    }
    
    //создание хедера таблицы
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomCollectionViewHeader.identifier, for: indexPath)
            return header

        default:
            return UICollectionReusableView()
        }
    }
    
}

//MARK: UICollectionViewDelegateFlowLayout
extension ViewController1: UICollectionViewDelegateFlowLayout {
    
    private var inset: CGFloat { return 20 }
    
    //Размер ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case verticalCollectionView:
            let width = (collectionView.bounds.width - inset * 4) / 3
            return CGSize(width: width, height: width)
        case horizontalCollectionView:
            if indexPath.item % 3 == 0 {
                let height = (collectionView.bounds.height - inset * 2)
                return CGSize(width: height, height: height)
            }
            let height = (collectionView.bounds.height - inset * 3) / 2
            return CGSize(width: height, height: height)
        default:
            return .zero
        }
    }
    
    //отступы для секции
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
//    расстояние между ячейками слева и справа
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    //    расстояние между ячейками сверху и снизу
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
//    действие при нажатии на ячейку
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Секция \(indexPath.section), ячейка \(indexPath.item)")
    }
    
//    Размер хедера
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch collectionView {
        case verticalCollectionView:
            return CGSize(width: collectionView.bounds.width - inset * 2, height: 50)
        default:
            return CGSize(width: 50, height: 0)

        }
    }
}
