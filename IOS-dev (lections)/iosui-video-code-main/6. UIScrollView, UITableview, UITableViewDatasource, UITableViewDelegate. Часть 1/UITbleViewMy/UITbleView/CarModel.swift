//
//  CarModel.swift
//  UITbleView
//
//  Created by Валерий Климченко on 11.05.2023.
//

import UIKit

struct CarModel {
    let name: String
    let image: UIImage
    let description: String?
    
    
    static func makeMockModel() -> [[CarModel]] {
        var model = [[CarModel]]()
        var section = [CarModel]()
        section.append(CarModel(name: "MB",
                                image: UIImage(named: "MB")!,
                                description: ""))
        section.append(CarModel(name: "bmw",
                                image: UIImage(named: "bmw")!,
                                description: "Description"))
        section.append(CarModel(name: "vv",
                                image: UIImage(named: "vv")!,
                                description: ""))
        
        for _ in 0...5 {
            model.append(section)
        }
    
        return model
    }
}
