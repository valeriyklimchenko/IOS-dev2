//
//  DetailViewController.swift
//  UITbleView
//
//  Created by Валерий Климченко on 16.05.2023.
//

import UIKit

//Такой протокол может реализовать только класс (AnyObject)
protocol DetailViewControllerDelegate: AnyObject {
    func changeText(_ text: String, indexPath: IndexPath)
}

final class DetailViewController: UIViewController {
    
    //Создаем экземпляр уведомления для отслеживания событий (появление и скрытие клавиатуры)
    private let ns = NotificationCenter.default
    
    private var indexPath = IndexPath()
    weak var delegate: DetailViewControllerDelegate?
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let detailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .black
        return view
    }()
    
    private let headerText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "car"
        label.textColor = .systemIndigo
        label.font = .systemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 30)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var detailTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Ввкдите текст"
        text.delegate = self
        return text
    }()
    
    private let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderColor = UIColor.red.cgColor
        image.layer.cornerRadius = 30
        return image
    }()
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ns.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        ns.addObserver(self, selector: #selector(keyboarHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //self - сильная ссылка, поэтому необходимо принудительно отписаться от обзерверов для освобождения памяти
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        ns.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        ns.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //Увеличиваем высоту отступа scrollView снизу на высоту клавиатуры на данном устройстве
    @objc func keyboardShow(notification: NSNotification) {
        if let keySize: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keySize.height
            scrollView.verticalScrollIndicatorInsets.bottom = keySize.height
        }
    }
    
    @objc func keyboarHide() {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets.bottom = .zero
    }
    
    func setupDetailVC(model: CarModel, indexPath: IndexPath) {
        self.indexPath = indexPath
        imageView.image = model.image
        headerText.text = model.name
        descriptionLabel.text = model.description
    }
    
    private func layout() {
        //Чтобы при появлении клавиатуры контент прокручивался, мы добавляем scrollView, внутрь которого кладем detailView, затем добавляем элементы. При этом нужно обязательно указать ширину detailView, равную ширине scrollView

        let inset: CGFloat = 16
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
                                    
        scrollView.addSubview(detailView)
        NSLayoutConstraint.activate([
            detailView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            detailView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            detailView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            detailView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
            
        [imageView, headerText, descriptionLabel, detailTextField].forEach { detailView.addSubview($0) }
        NSLayoutConstraint.activate([
            headerText.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: inset),
            headerText.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 50),
            headerText.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -inset),
            
            imageView.leadingAnchor.constraint(equalTo: detailView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: headerText.bottomAnchor, constant: inset),
            imageView.trailingAnchor.constraint(equalTo: detailView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: inset),
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: inset),
            descriptionLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -inset),
            
            detailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            detailTextField.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 16),
            detailTextField.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -16),
            detailTextField.heightAnchor.constraint(equalToConstant: 40),
            detailTextField.bottomAnchor.constraint(equalTo: detailView.bottomAnchor)
        
        ])
    }
    
}

//Скрытие клавиатуры при нажатии return
extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        detailTextField.endEditing(true)
        descriptionLabel.text = textField.text
        delegate?.changeText(textField.text!, indexPath: indexPath)
        return true
    }
}
