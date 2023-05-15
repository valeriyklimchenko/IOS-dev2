import UIKit

let mainView = UIView(frame: CGRect(x: 50, y: 50, width: 500, height: 500))
mainView.backgroundColor = .systemYellow
let subView = UIView(frame: CGRect(origin: CGPoint(x: 15, y: 15), size: CGSize(width: 100, height: 150)))
subView.backgroundColor = .systemBlue
mainView.addSubview(subView)
