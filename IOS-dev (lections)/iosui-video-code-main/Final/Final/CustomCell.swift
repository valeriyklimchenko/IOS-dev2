//
//  CustumCell.swift
//  Final
//
//  Created by Валерий Климченко on 03.07.2023.
//

import UIKit

protocol customCellDelegate: AnyObject {
    func didTapImage(image: UIImage?, imageRect: CGRect, indexPath: IndexPath)
}

final class CustomCell: UITableViewCell {
    
    //MARK: - private
    //создаем переменную, имеющую тип протокола (слабая ссылка на протокол)
    weak var delegate: customCellDelegate?
    
    private var indexPathCell = IndexPath()
    
    private let imageViewForCell: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "1")
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - func
    func setIndexPath(indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    //MARK: - Gesture
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        imageViewForCell.addGestureRecognizer(tapGesture)
    }
    
    //MARK: - Layout
    private func layout() {
        contentView.addSubview(imageViewForCell)
        
        NSLayoutConstraint.activate([
            imageViewForCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            imageViewForCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageViewForCell.widthAnchor.constraint(equalToConstant: 50),
            imageViewForCell.heightAnchor.constraint(equalToConstant: 50),
            imageViewForCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    //MARK: - Actions
    @objc private func tapAction() {
        //Ячейка делегирует обязанности по отображению анимации. Поэтому создаем в CustomCell протокол
        //При нажатии обрщаемся к делегату с помощью созданной переменной
        delegate?.didTapImage(image: imageViewForCell.image, imageRect: imageViewForCell.frame, indexPath: indexPathCell)
    }
}
