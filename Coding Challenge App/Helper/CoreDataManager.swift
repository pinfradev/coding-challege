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
    
    func savePhoto(photo: PhotoModel,
                   successBlock: () -> Void,
                   errorBlock: (_ error: String?) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("error no appDelegate")
            errorBlock(nil)
            return
        }
        if let _ = self.getObjectBy(id: photo.id) {
            errorBlock(Constants.Strings.Alerts.errorImageExists)
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
        successBlock()
    }
    
    func getPhotos() -> [Photo] {
        let fetchRequest: NSFetchRequest<Photo> = Photo.fetchRequest()
        do {
            let result = try self.context.fetch(fetchRequest)
            return result
        } catch {
            print("error getting current Photos")
        }
        return []
    }
    
    func deletePhoto(id: String, successBlock: () -> Void, errorBlock: () -> Void) {
        guard let object = self.getObjectBy(id: id) else {
            errorBlock()
            return
        }
        self.context.delete(object)
        successBlock()
    }
    
    private func getObjectBy(id: String) -> Photo? {
        let fetchRequest: NSFetchRequest<Photo> = Photo.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        let object = try? self.context.fetch(fetchRequest).first
        return object
    }
    
    
}

