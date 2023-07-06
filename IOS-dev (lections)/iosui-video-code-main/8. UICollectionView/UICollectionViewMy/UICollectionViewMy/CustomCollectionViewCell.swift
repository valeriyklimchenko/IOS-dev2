//
//  CustomCollectionViewCell.swift
//  UICollectionViewMy
//
//  Created by Валерий Климченко on 14.06.2023.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customiseCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {}
    
    private func customiseCell() {
        contentView.backgroundColor = .red
        contentView.layer.cornerRadius = 15
    }
    
}
