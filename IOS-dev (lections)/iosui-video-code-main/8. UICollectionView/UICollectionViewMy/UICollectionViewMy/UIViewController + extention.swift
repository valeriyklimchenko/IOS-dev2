//
//  UIViewController + extention.swift
//  UICollectionViewMy
//
//  Created by Валерий Климченко on 16.06.2023.
//

import UIKit

extension ViewController1 {
    func makeCollectionView(scrollDirection: UICollectionView.ScrollDirection) -> UICollectionView {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray2
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.register(CustomCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomCollectionViewHeader.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }
}
