//
//  LocalDataManager.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 13/2/21.
//

import Foundation

class LocalDataManager {
    
    private let manager = CoreDataManager()
    
    func saveLocalPhoto(photo: PhotoModel) {
        manager.savePhoto(photo: photo)
    }
    
    func getLocalPhotos() -> [PhotoModel] {
        var photoModelArray = [PhotoModel]()
        let photos = manager.getPhotos()
        for photo in photos {
            let currentPhoto = PhotoModel(url: photo.url ?? "",
                                          id: photo.id ?? "",
                                          userName: photo.user_name ?? "",
                                          userId: photo.user_id,
                                          userBio: photo.biography,
                                          imageData: photo.data)
            photoModelArray.append(currentPhoto)
        }
        return photoModelArray
    }
    
    func deleteLocalPhotoWith(id: String) {
        manager.deletePhoto(id: id)
    }
}
