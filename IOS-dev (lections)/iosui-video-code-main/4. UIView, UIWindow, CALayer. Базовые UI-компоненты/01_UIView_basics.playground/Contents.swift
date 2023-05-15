import UIKit
import PlaygroundSupport

//let mainView = UIView(
//    frame: CGRect(
//        x: 50.0,
//        y: 50.0,
//        width: 500.0,
//        height: 500.0
//    )
//) // parent view = superview
//mainView.backgroundColor = .systemYellow
//
//let secondaryView = UIView(
//    frame: CGRect(
//        origin: CGPoint(
//            x: 15.0,
//            y: 15.0
//        ),
//        size: CGSize(
//            width: 100.0,
//            height: 150.0
//        )
//    )
//)
//secondaryView.backgroundColor = .systemBlue // subview
//
//mainView.addSubview(secondaryView)
//
//PlaygroundPage.current.liveView = mainView

let mainView = UIView(
    frame: CGRect(x: 50,
                  y: 50,
                  width: 500,
                  height: 500
                 )
)
mainView.backgroundColor = .systemYellow

let secondaryView = UIView(
    frame: (
        CGRect(
            origin: CGPoint(
                x: 15,
                y: 15
            ),
            size: CGSize(
                width: 100,
                height: 150)
        )
    )
)
secondaryView.backgroundColor = .systemBlue

mainView.addSubview(secondaryView)
PlaygroundPage.current.liveView = mainView
