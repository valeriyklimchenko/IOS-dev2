//
//  ViewController.swift
//  TableView
//
//  Created by Shishkin Ivan Sergeevich on 17.04.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private let carModel = CarModel.makeMockModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
//        UITextField()
    }
    
    private func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        carModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carModel[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//        var content: UIListContentConfiguration = cell.defaultContentConfiguration()
//        content.text = carModel[indexPath.row].name
//        content.secondaryText = "Секция \(indexPath.section) ячейка \(indexPath.row)"
//        cell.contentConfiguration = content
//        return cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
//        let section: [CarModel] = carModel[indexPath.section]
//        let car: CarModel = section[indexPath.row]
        cell.setupCell(model: carModel[indexPath.section][indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("table.frame = \(tableView.frame)")
//        print("table.bounds = \(tableView.bounds)")
    }
}
