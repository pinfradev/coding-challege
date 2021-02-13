//
//  CoreDataManager.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 13/2/21.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    private var context: NSManagedObjectContext!
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
    }
    
    func savePhoto(photo: PhotoModel) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("error no appDelegate")
            return
        }
        let currentPhoto = Photo(context: self.context)
        currentPhoto.id = photo.id
        currentPhoto.url = photo.url
        currentPhoto.user_name = photo.userName
        currentPhoto.user_id = photo.id
        currentPhoto.biography = photo.userBio
        currentPhoto.data = photo.imageData
        appDelegate.saveContext()
    }
    
    
}

