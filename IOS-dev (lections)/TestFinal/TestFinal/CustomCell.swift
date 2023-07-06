//
//  CustomCell.swift
//  TestFinal
//
//  Created by Shishkin Ivan Sergeevich on 06.03.2023.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func didTapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}

final class CustomCell: UITableViewCell {
    
    weak var delegate: CustomCellDelegate?
    
    private var indexPathCell = IndexPath()
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "call")
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = .red
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        addGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImageView.image = nil
    }
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        cellImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        delegate?.didTapImageInCell(cellImageView.image, frameImage: cellImageView.frame, indexPath: indexPathCell)
    }
    
    private func layout() {
        contentView.addSubview(cellImageView)
        
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellImageView.widthAnchor.constraint(equalToConstant: 50),
            cellImageView.heightAnchor.constraint(equalToConstant: 50),
            cellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
