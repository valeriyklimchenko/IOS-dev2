//
//  Feed.swift
//  MyFirstApp2
//
//  Created by Валерий Климченко on 10.04.2023.
//

import UIKit

class Feed: UIViewController {

    //Создаем свойство (экземпляр класса FieldView), описывающее визуальный элемент. Класс Bundle обращается к главной папке приложения. Метод loadNibNamed загружает массив всех view, которые могут быть определены в рамках одного xib файла
    private var field: FieldView {
        
       let view = Bundle.main.loadNibNamed(
            "Field",
            owner: nil,
            options: nil
            //        забираем из массива первый элемент и приводим его к типу данных FieldView
       )?.first as! FieldView
        
//        Свойство frame используется для настройки размеров элемента
        view.frame = CGRect(x: 100, y: 100, width: 150, height: 200)
        
        return view
    }
//    Код явно загружает элементы в ОП и отобразит их
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        
//        Добавляем элемент на экран у корневого view контроллера
        view.addSubview(field)

    }
    
}
