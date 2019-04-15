//
//  ViewController.swift
//  froNik
//
//  Created by Mac on 4/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var urlTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        urlTextView.text = "https://bigpicture.ru/wp-content/uploads/2014/08/everest01.jpg, https://bigpicture.ru/wp-content/uploads/2014/08/everest02.jpg, https://bigpicture.ru/wp-content/uploads/2014/08/everest03.jpg, https://bigpicture.ru/wp-content/uploads/2014/08/everest04.jpg, https://bigpicture.ru/wp-content/uploads/2014/08/everest05.jpg, https://bigpicture.ru/wp-content/uploads/2014/08/everest06.jpg, https://bigpicture.ru/wp-content/uploads/2014/08/everest07.jpg, https://bigpicture.ru/wp-content/uploads/2014/08/everest08.jpg, https://bigpicture.ru/wp-content/uploads/2014/08/everest09.jpg, https://bigpicture.ru/wp-content/uploads/2014/08/everest10.jpg, https://bigpicture.ru/wp-content/uploads/2015/05/solotrips01.jpg, https://bigpicture.ru/wp-content/uploads/2015/05/solotrips02.jpg, https://bigpicture.ru/wp-content/uploads/2015/05/solotrips03.jpg, https://bigpicture.ru/wp-content/uploads/2015/05/solotrips04.jpg, https://bigpicture.ru/wp-content/uploads/2015/05/solotrips05.jpg, https://bigpicture.ru/wp-content/uploads/2015/05/solotrips06.jpg, https://bigpicture.ru/wp-content/uploads/2015/05/solotrips07.jpg, https://bigpicture.ru/wp-content/uploads/2015/05/solotrips08.jpg, https://bigpicture.ru/wp-content/uploads/2015/05/solotrips09.jpg, https://bigpicture.ru/wp-content/uploads/2015/05/solotrips10.jpg, https://bigpicture.ru/wp-content/uploads/2015/05/solotrips11.jpg"
        urlTextView.layer.cornerRadius = 5
        urlTextView.layer.borderWidth = 2.0
        urlTextView.layer.borderColor = UIColor.orange.cgColor
    }
    
    @IBAction func clickToFavoritePicture(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "allSavePicture", sender: self)
    }
    
    @IBAction func downloadButton(_ sender: UIButton) {
        guard let newUrl = urlTextView.text else { return }
        urlArray = newUrl.components(separatedBy: ",").map{$0.filter{!" \n".contains($0)}}
        performSegue(withIdentifier: "downloadNewImageTable", sender: nil)
    }
}

