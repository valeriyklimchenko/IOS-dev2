//
//  ViewController.swift
//  UITbleView
//
//  Created by Валерий Климченко on 11.05.2023.
//

import UIKit

//Такой протокол может реализовать только класс (AnyObject)
protocol DetailViewControllerDelegate: AnyObject {
    func changeText(_ text: String, indexPath: IndexPath)
}

final class ViewController: UIViewController {
    
    private var carModel = CarModel.makeMockModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustoTableViewCell.self, forCellReuseIdentifier: CustoTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
//        Значение по умолчанию для высоты ячеек
//        tableView.rowHeight = UITableView.automaticDimension
        
//        tableView.showsVerticalScrollIndicator = false
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
        cell.setupCell(model: carModel[indexPath.section][indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //Как меняется bounds при скролле
//        print("table.frame = \(tableView.frame)")
//        print("table.bounds = \(tableView.bounds)")
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let custumHeader = CustumHeaderView()
        custumHeader.setupHeaderText("Это хедер секции \(section)")
        return custumHeader
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = CustumHeaderView()
        footer.setupHeaderText("Это футер секции \(section)")
        return footer
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            carModel[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section % 2 == 0 ? 50 :100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath)
        let detailView = DetailViewController()
        detailView.setupDetailVC(model: carModel[indexPath.section][indexPath.row], indexPath: indexPath)
//        present(detailView, animated: true)
        navigationController?.pushViewController(detailView, animated: true)
        
        detailView.delegate = self
    }
    
}

extension ViewController: DetailViewControllerDelegate {
    func changeText(_ text: String, indexPath: IndexPath) {
        carModel[indexPath.section][indexPath.row].description = text
        tableView.reloadRows(at: [indexPath], with: .left)
    }
    
    
}
