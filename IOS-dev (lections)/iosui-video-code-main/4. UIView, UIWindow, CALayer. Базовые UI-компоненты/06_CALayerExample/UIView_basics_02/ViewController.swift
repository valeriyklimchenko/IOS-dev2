import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Загружаем экземпляр класса UIView, созданный в Storyboard: обращаемся к классу Bundle, получаем основной набор файлов, ресурсов и загружаем ресурс по его имени
        if let orangeView = Bundle.main.loadNibNamed(
            "TestView",
            owner: nil,
            options: nil
        )?.first as? UIView {
            orangeView.frame = CGRect(
                x: 100.0,
                y: 200.0,
                width: 200.0,
                height: 100.0
            )
            
            orangeView.layer.cornerRadius = 20.0

            orangeView.layer.shadowOffset = CGSize(width: 10.0, height: 10.0) //Смещение
            orangeView.layer.shadowOpacity = 0.7 //Прозрачность
            orangeView.layer.shadowRadius = 5.0
//            Layer не работает с фр. UIKit, только Core Animation и Core Graphics
            orangeView.layer.shadowColor = UIColor.systemRed.cgColor

            orangeView.layer.borderColor = UIColor.systemBlue.cgColor
            orangeView.layer.borderWidth = 3

//Контент заменяет backgraundColor
            orangeView.layer.contents = UIImage(named: "cat")?.cgImage
            orangeView.layer.contentsGravity = .resizeAspect
//            Чтобы сочетать контент и UIView и Layer, нужно сочетать maskTobounds и clipsToBounds
            orangeView.layer.masksToBounds = true
//
            orangeView.layer.backgroundColor = UIColor.systemYellow.cgColor
            orangeView.layer.opacity = 0.5
//
            // Create a new layer
            let sublayer = CALayer()

            // Configure the sublayer
            sublayer.backgroundColor = UIColor.red.cgColor
            sublayer.shadowOffset = CGSize(width: 0.0, height: 3.0)
            sublayer.shadowRadius = 5.0
            sublayer.shadowOpacity = 0.8
            sublayer.frame = CGRect(x: 30, y: 0, width: 100, height: 100)

            orangeView.layer.addSublayer(sublayer)

//            Контент View обрезается/не обрезается согласно границ внутренней системы координат
            orangeView.clipsToBounds = false


            view.addSubview(orangeView)
        }
    }
}

