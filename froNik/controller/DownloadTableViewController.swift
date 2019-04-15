//
//  DownloadTableViewController.swift
//  froNik
//
//  Created by Mac on 4/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class DownloadTableViewController: UITableViewController {

    override func viewDidLoad() {
        readOfCOreData()
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urlArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("DownloadTableViewCell", owner: self, options: nil)?.first as! DownloadTableViewCell //форс
        cell.titleLabelCell.text = urlArray[indexPath.row].components(separatedBy: "/").last
        cell.activityIndicatorCell.isHidden = false
        cell.activityIndicatorCell.startAnimating()
        OperationQueue.main.maxConcurrentOperationCount = 5
        OperationQueue.main.addOperation {
        //}
        //DispatchQueue.main.async {
            cell.ImageCell.image = downloadImageFunc(urlString: urlArray[indexPath.row])
            if cell.ImageCell.image != nil {
                cell.activityIndicatorCell.stopAnimating()
                cell.activityIndicatorCell.isHidden = true
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        forkeyToDetail = NSString(string: urlArray[indexPath.row])
        performSegue(withIdentifier: "detailImagedownloadImage", sender: self)
    }
}
