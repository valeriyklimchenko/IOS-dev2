//
//  CustoTableViewCell.swift
//  UITbleView
//
//  Created by Валерий Климченко on 12.05.2023.
//

import UIKit

final class CustoTableViewCell: UITableViewCell {
    
    private lazy var whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private lazy var headerCell: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var descriptionCell: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var imageCell: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        customize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageCell.image = nil
        headerCell.text = nil
        descriptionCell.text = nil
    }
    
    func setupCell(model: CarModel) {
        imageCell.image = model.image
        headerCell.text = model.name
        descriptionCell.text = model.description
    }
    
    private func layout() {
    
        [whiteView, imageCell, headerCell, descriptionCell].forEach { contentView.addSubview($0) }
        
        let viewInset: CGFloat = 0
        let imageInset: CGFloat = 8
        let labelInset: CGFloat = 16
        let heightView: CGFloat = 100
        NSLayoutConstraint.activate([
            
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageCell.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: imageInset),
            imageCell.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: imageInset),
            imageCell.widthAnchor.constraint(equalToConstant: heightView * 1.4),
            imageCell.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -imageInset),
            
            headerCell.leadingAnchor.constraint(equalTo: imageCell.trailingAnchor, constant: labelInset),
            headerCell.topAnchor.constraint(equalTo: imageCell.topAnchor),
            headerCell.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: labelInset),
            
            descriptionCell.leadingAnchor.constraint(equalTo: imageCell.trailingAnchor, constant: labelInset),
            descriptionCell.topAnchor.constraint(equalTo: headerCell.bottomAnchor, constant: labelInset),
            descriptionCell.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -labelInset),
            descriptionCell.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -viewInset)
        ])
    }
    
    private func customize() {
        whiteView.layer.cornerRadius = 10
        whiteView.layer.borderColor = UIColor.black.cgColor
        whiteView.layer.borderWidth = 3
    }
    
}
