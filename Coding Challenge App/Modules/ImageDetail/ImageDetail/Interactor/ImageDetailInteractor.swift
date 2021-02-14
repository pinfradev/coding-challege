//
//  ImageDetailImageDetailInteractor.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

class ImageDetailInteractor: ImageDetailInteractorInput {
    

    weak var output: ImageDetailInteractorOutput!

    var localDataManager: LocalDataManager = LocalDataManager()
    
    //MARK: ImageDetailInteractorInput
    func saveLocalPhoto(photo: PhotoModel) {
        localDataManager.saveLocalPhoto(photo: photo)
    }
    
    func deleteLocalPhotoWith(id: String) {
        localDataManager.deleteLocalPhotoWith(id: id)
    }
}
