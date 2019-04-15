//
//  model.swift
//  froNik
//
//  Created by Mac on 4/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import CoreData

var forkeyToDetail : NSString = ""

var imageCache = NSCache<NSString, UIImage>()

var urlArray : [String] = []

var imageCoreData : [FavoriteImage] = []

var imageDetail = UIImage()

func downloadImageFunc(urlString : String) -> UIImage? {
    if imageCache.object(forKey: urlString as NSString) != nil {
        print("загружено из кэша \(urlString)")
        let image = imageCache.object(forKey: urlString as NSString)
        return image
    } else {
        guard let url = URL(string: urlString) else { return nil}
        let data = try? Data(contentsOf: url)
        if let imageData = data {
            guard let image = UIImage(data: imageData) else { return nil}
            imageCache.setObject(image, forKey: urlString as NSString)
            print("загружено из сети по ссылке \(urlString)")
            return image
        } else {
            return nil
        }
    }
}

func saveToCoreData(url : NSString) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let managedContext = appDelegate.persistentContainer.viewContext
    let new = NSEntityDescription.insertNewObject(forEntityName: "FavoriteImageCoreData", into: managedContext) as? FavoriteImage
    guard let newImage =  imageCache.object(forKey: url) else { return }
    let convertToJPEGdata = newImage.jpegData(compressionQuality: 1)
    new?.setValue(url, forKey: "urlFavoriteImage")
    new?.setValue(convertToJPEGdata, forKey: "image")
    do {
        try managedContext.save()
    } catch {
        print("falled save item")
    }
}

func translateToImage(dataImage : NSData?) -> UIImage? {
    guard let newImage = UIImage(data: dataImage! as Data) else { return nil }
    return newImage
}

func readOfCOreData() {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchManaged = NSFetchRequest<NSManagedObject>(entityName: "FavoriteImageCoreData")
    do {
        imageCoreData = try managedContext.fetch(fetchManaged) as? [FavoriteImage] ?? []
        for image in imageCoreData {
            guard let forKey = image.urlFavoriteImage, let uiImage = translateToImage(dataImage: image.image) else { return }
            imageCache.setObject(uiImage, forKey: forKey as NSString)
        }
    } catch {
        print("failed fetch")
    }
}

