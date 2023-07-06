//
//  CustomCollectionViewHeader.swift
//  UICollectionViewMy
//
//  Created by Валерий Климченко on 16.06.2023.
//

import UIKit


final class CustomCollectionViewHeader: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
