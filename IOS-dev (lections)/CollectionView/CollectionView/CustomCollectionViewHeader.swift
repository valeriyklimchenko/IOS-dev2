//
//  CustomCollectionViewHeader.swift
//  CollectionView
//
//  Created by Shishkin Ivan Sergeevich on 24.04.2023.
//

import UIKit

final class CustomCollectionViewHeader: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
