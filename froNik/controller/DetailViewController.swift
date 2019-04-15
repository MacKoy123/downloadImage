//
//  DetailViewController.swift
//  froNik
//
//  Created by Mac on 4/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.image = imageCache.object(forKey: forkeyToDetail)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addImageToFavoritePicture(_ sender: UIButton) {
        readOfCOreData()
        if imageCoreData.filter({$0.urlFavoriteImage == String(forkeyToDetail)}).isEmpty {
            saveToCoreData(url: forkeyToDetail)
            showAllert(title: "Картинка успешно добавлена в избранные")
        }
        else {
            showAllert(title: "Эта картинка уже добавлена в избранное")
        }
    }
    
    
    
    func showAllert(title : String) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let alertActionCancel = UIAlertAction(title: "OK", style: .default){ (_) in
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(alertActionCancel)
        present(alertController, animated: true, completion: nil)
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
