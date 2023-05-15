//
//  ViewController.swift
//  UITbleView
//
//  Created by Валерий Климченко on 11.05.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    let carModel = CarModel.makeMockModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustoTableViewCell.self, forCellReuseIdentifier: CustoTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }

    private func layout() {
        view.addSubview(tableView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        
    }
}

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        carModel[section].count
//    }
extension ViewController: UITableViewDataSource {
    //Необязательный метод, по умолчанию 1 секция
    func numberOfSections(in tableView: UITableView) -> Int {
        carModel.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carModel[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//        //дефолтная ячейка
//        var content: UIListContentConfiguration = cell.defaultContentConfiguration()
//        content.text = carModel[indexPath.section][indexPath.row].name
////        print(carModel[indexPath.section][indexPath.row].name)
//        content.secondaryText = "Секция \(indexPath.section) ячкйка \(indexPath.row)"
//        cell.contentConfiguration = content
//        return cell
        
        //Кастомная ячейка
        //Удалить из очереди повторно используемую ячейку
        let cell = tableView.dequeueReusableCell(withIdentifier: CustoTableViewCell.identifier, for: indexPath) as! CustoTableViewCell
//        let section = carModel[indexPath.section]
//        let cel = section[indexPath.row]
//        cell.setupSell(model: cel)
        cell.setupSell(model: carModel[indexPath.section][indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("table.frame = \(tableView.frame)")
//        print("table.bounds = \(tableView.bounds)")
    }
}
