//
//  ViewController.swift
//  Webinar15
//
//  Created by Bitec mini on 15.04.2023.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var btn: UIButton!
    var imagePicke = UIImagePickerController()
    
    
    @IBAction func btn2Click(_ sender: Any) {
    
        DispatchQueue.global().async { [weak self] in
            let url = URL(string: "https://bit.ly/2LMtByx")
            if let data = try? Data(contentsOf: url!){
                if let img = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.img.image = img
                        
                    }
                }
            }
        }
            
    }
    
    
    @IBAction func btnClick(_ sender: Any) {
        
    
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            
            imagePicke.delegate = self
            imagePicke.sourceType = .savedPhotosAlbum
            imagePicke.allowsEditing = true
            
            present(imagePicke, animated: true)
            
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else {return}
        
        let imgName = "\(UUID().uuidString).jpg"
        let imgPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imgName)
        print(imgPath)

        if let jpgData = image.jpegData(compressionQuality: 0.6){
            do {
                try jpgData.write(to: imgPath)
            }catch{
                print(error)
            }
            
        }
        img.image = image

        dismiss(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

