import UIKit

class ResponderViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        
        let tapRed = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapRed)
        )
        view.addGestureRecognizer(tapRed)
        return view
    }()
    
    private lazy var blueView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        
        let tapBlue = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapBlue)
        )
        view.addGestureRecognizer(tapBlue)
        
        return view
    }()
    
    private lazy var greenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        let tapGreen = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapGreen)
        )
        view.addGestureRecognizer(tapGreen)
        
        return view
    }()
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Responder Chain"
        view.backgroundColor = .systemBackground
        view.isUserInteractionEnabled = true

        view.addSubview(redView)
        redView.addSubview(blueView)
        blueView.addSubview(greenView)
        setupConstrants()
        setupActions()
    }
    
    //MARK: actions
    @objc private func didTapRoot() {
        print("did tap root")
    }
    @objc private func didTapRed() {
        print("did tap red")
    }
    @objc private func didTapBlue() {
        print("did tap blue")
    }
    @objc private func didTapGreen() {
        print("did tap green")
    }
    
    //MARK: private
    private func setupActions() {
        let tapRoot = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapRoot)
            )
        view.addGestureRecognizer(tapRoot)
    }
    
    private func setupConstrants() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            redView.heightAnchor.constraint(equalToConstant: 300),
            redView.widthAnchor.constraint(equalToConstant: 300),
            redView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            redView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            
            blueView.heightAnchor.constraint(equalToConstant: 200),
            blueView.widthAnchor.constraint(equalToConstant: 200),
            blueView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            blueView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            
            greenView.heightAnchor.constraint(equalToConstant: 100),
            greenView.widthAnchor.constraint(equalToConstant: 100),
            greenView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            greenView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)
        ])
        
    }
}
