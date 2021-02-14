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
        localDataManager.saveLocalPhoto(photo: photo, successBlock: {
            self.output.localSaveSucceded()
        }, errorBlock: { error in
            self.output.localSaveFailed(error: error)
        })
    }
    
    func deleteLocalPhotoWith(id: String) {
        localDataManager.deleteLocalPhotoWith(id: id,successBlock: {
            self.output.localDeleteSucceded()
        }, errorBlock: {
            self.output.localDeleteFailed()
        })
    }
}
