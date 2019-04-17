//
//  SavedTableViewController.swift
//  froNik
//
//  Created by Mac on 4/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import CoreData


class SavedTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            readOfCOreData()
            self.tableView.reloadData()
        }
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageCoreData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("SaveTableViewCell", owner: self, options: nil)?.first as! SaveTableViewCell
        if let urlFavoriteImage = imageCoreData[indexPath.row].urlFavoriteImage {
            cell.saveLabel.text = urlFavoriteImage.components(separatedBy: "/").last
            cell.saveActivityIndicatorView.isHidden = false
            cell.saveActivityIndicatorView.startAnimating()
            OperationQueue.main.maxConcurrentOperationCount = 5
            OperationQueue.main.addOperation {
            //}
            //DispatchQueue.main.async {
                if let image = translateToImage(dataImage: imageCoreData[indexPath.row].image) {
                    cell.saveImage.image = image
                    imageCache.setObject(image, forKey: urlFavoriteImage as NSString)
                    cell.saveActivityIndicatorView.stopAnimating()
                    cell.saveActivityIndicatorView.isHidden = true
                }
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let alertController = UIAlertController(title: "Вы действительно хотите удалить картинку?",
                                                    message: "Картинка будет удалена без возможности восстановления",
                                                    preferredStyle: .alert)
            let alertActionDelete = UIAlertAction(title: "Удалить", style: .default) { (_) in
                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
                let managedContext = appDelegate.persistentContainer.viewContext
                managedContext.delete(imageCoreData[indexPath.row])
                imageCoreData.remove(at: indexPath.row)
                do {
                    try managedContext.save()
                    self.tableView.reloadData()
                } catch {
                    print("Невозможно удалить товар")
                }
            }
            let alertActionCancel = UIAlertAction(title: "Отмена", style: .default, handler: nil)
            alertController.addAction(alertActionDelete)
            alertController.addAction(alertActionCancel)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let image = UIImage(data: imageCoreData[indexPath.row].image! as Data) else { return }
        imageDetail = image
        performSegue(withIdentifier: "favoriteShowDetail", sender: self)
    }

}
