//
//  CustomCollectionViewCell.swift
//  CollectionView
//
//  Created by Shishkin Ivan Sergeevich on 24.04.2023.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeCell() {
        contentView.backgroundColor = .red
        contentView.layer.cornerRadius = 15
    }
}
