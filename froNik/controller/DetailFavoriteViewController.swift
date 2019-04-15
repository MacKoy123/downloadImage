//
//  DetailFavoriteViewController.swift
//  froNik
//
//  Created by Mac on 4/15/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class DetailFavoriteViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImage.image = imageDetail
        // Do any additional setup after loading the view.
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
