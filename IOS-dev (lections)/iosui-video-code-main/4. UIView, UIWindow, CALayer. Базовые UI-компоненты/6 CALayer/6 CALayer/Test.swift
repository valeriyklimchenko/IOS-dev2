//
//  Test.swift
//  6 CALayer
//
//  Created by Валерий Климченко on 06.05.2023.
//

import UIKit

class TestView: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        
        ctx.setStrokeColor(
            red: 1,
            green: 0,
            blue: 0,
            alpha: 1
        )
        let rectangle = CGRect(
            x: 10,
            y: 10,
            width: 50,
            height: 50
        )
        ctx.stroke(rectangle)
    }
}
