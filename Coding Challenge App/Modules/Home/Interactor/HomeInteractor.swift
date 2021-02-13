//
//  HomeHomeInteractor.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

class HomeInteractor: HomeInteractorInput {
    
    //MARK: Properties
    var page: Int = 1
    var size: Int = 10
    weak var output: HomeInteractorOutput!

    //MARK: HomeInteractorOutput
    func getImages() {
        ImageAPI.shared().getAllImages(page: self.page,
                                       perPage: self.size) { (response) in
            switch response {
                case .success(let photos):
                    let photosModel = self.getPhotoModel(photos: photos)
                    self.output.getImagesSucceded(data: photosModel)
                case .failure(let error):
                    self.output.getImagesFailed(error: error.description)
            }
            
        }
    }
    
    
    //MARK: Private functions
    
    private func getPhotoModel(photos: [PhotoResponse]) -> [PhotoModel] {
        var models = [PhotoModel]()
        for photo in photos {
            let currentModel = PhotoModel(url: photo.urls?.full ?? "",
                                          id: photo.id,
                                          userName: photo.user?.id ?? "",
                                          userId: photo.user?.id,
                                          userBio: photo.user?.bio)
            models.append(currentModel)
        }
        return models
    }
}
