//
//  Field.swift
//  MyFirstApp2
//
//  Created by Валерий Климченко on 10.04.2023.
//

import UIKit

class FieldView: UIView {
    
    //Объект загружен в оперативную память и может использоваться в визуальном представлении на экране смартфона
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .systemPurple
    }
    
}

//Чтобы увидеть на экране экземпляр класса FieldView, его нужно создать и отобразить в рамках контроллера представления
