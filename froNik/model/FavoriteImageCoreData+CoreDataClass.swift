//
//  FavoriteImageCoreData+CoreDataClass.swift
//  froNik
//
//  Created by Mac on 4/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//
//

import Foundation
import CoreData

@objc(FavoriteImageCoreData)
public class FavoriteImage: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteImage> {
        return NSFetchRequest<FavoriteImage>(entityName: "FavoriteImageCoreData")
    }
    
    @NSManaged public var urlFavoriteImage: String?
    @NSManaged public var image: NSData?
    
}
