//
//  DetailViewController.swift
//  Project_3_1-3
//
//  Created by Игорь Чумиков on 19.02.2021.
//  Copyright © 2021 Игорь Чумиков. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //создать кнопку передачи
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(upFrendFlag))
        
        if let imageToLoad = selectedImage {
            imageView.layer.borderWidth = 1
            imageView.layer.borderColor = UIColor.lightGray.cgColor
            imageView.image = UIImage(named: imageToLoad)
            title = "Flag of \(imageToLoad.uppercased().replacingOccurrences(of: "@3X.PNG", with: ""))"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController Показать
        navigationController?.hidesBarsOnTap = true
    }
     //navigationController скрыть
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func upFrendFlag() {
         guard let image = imageView.image?.jpegData(compressionQuality: 0.9) else {return}
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
