//
//  ViewController.swift
//  CollectionView
//
//  Created by Shishkin Ivan Sergeevich on 24.04.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Model
    
    private var array: [Int] {
        var array = [Int]()
        for element in 0...30 {
            array.append(element)
        }
        return array
    }
    
    private var horizontalArray: [Int] {
        var array = [Int]()
        for element in 0...30 {
            array.append(element)
        }
        return array
    }
    
    // MARK: - UI
    
    private lazy var verticalCollectionView = makeCollectionView(scrollDirection: .vertical)
    private lazy var horizontalCollectionView = makeCollectionView(scrollDirection: .horizontal)
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setupCollections()
        verticalCollectionView.reloadData()
    }
    
    // MARK: - Private Methods
    
    private func setupCollections() {
        verticalCollectionView.dataSource = self
        verticalCollectionView.delegate = self
        
        horizontalCollectionView.dataSource = self
        horizontalCollectionView.delegate = self
        
        verticalCollectionView.reloadData()
        horizontalCollectionView.reloadData()
    }
    
    private func layout() {
        view.addSubview(verticalCollectionView)
        view.addSubview(horizontalCollectionView)
        
        NSLayoutConstraint.activate([
            // verticalCollectionView
            verticalCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            verticalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2),
            verticalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // horizontalCollectionView
            horizontalCollectionView.topAnchor.constraint(equalTo: verticalCollectionView.bottomAnchor, constant: 30),
            horizontalCollectionView.leadingAnchor.constraint(equalTo: verticalCollectionView.leadingAnchor),
            horizontalCollectionView.trailingAnchor.constraint(equalTo: verticalCollectionView.trailingAnchor),
            horizontalCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case verticalCollectionView:
            return array.count
        case horizontalCollectionView:
            return horizontalArray.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCollectionViewCell.identifier,
            for: indexPath) as! CustomCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: CustomCollectionViewHeader.identifier,
                for: indexPath)
            return header
            
        default:
            return UICollectionReusableView()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    private var inset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case verticalCollectionView:
            let width = (collectionView.bounds.width - inset * 4) / 3
            return CGSize(width: width, height: width)
        case horizontalCollectionView:
            if indexPath.item % 3 == 0 {
                let height = collectionView.bounds.height - inset * 2
                return CGSize(width: height, height: height)
            }
            let height = (collectionView.bounds.height - inset * 3) / 2
            return CGSize(width: height, height: height)
            
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset,
                     left: inset,
                     bottom: inset,
                     right: inset)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        inset
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Секция = \(indexPath.section), ячейка = \(indexPath.item)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch collectionView {
        case verticalCollectionView:
            return CGSize(width: collectionView.bounds.width - inset * 2, height: 100)
        default:
            return .zero
        }
    }
}
