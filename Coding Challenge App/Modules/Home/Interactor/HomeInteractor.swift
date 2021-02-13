//
//  HomeHomeInteractor.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

class HomeInteractor: HomeInteractorInput {
    
    //MARK: Properties
    let initialPage = 1
    var page: Int = 1
    var size: Int = 10
    weak var output: HomeInteractorOutput!

    //MARK: HomeInteractorOutput
    func getImages() {
        self.page = self.initialPage
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
    
    func getMoreImages() {
        self.page += 1
        ImageAPI.shared().getAllImages(page: self.page,
                                       perPage: self.size) { (response) in
            switch response {
                case .success(let photos):
                    let photosModel = self.getPhotoModel(photos: photos)
                    self.output.getMoreImagesSucceded(data: photosModel)
                case .failure(let error):
                    self.output.getMoreImagesFailed(error: error.description)
            }
            
        }
    }
    //MARK: Private functions
    
    private func getPhotoModel(photos: [PhotoResponse]) -> [PhotoModel] {
        var models = [PhotoModel]()
        for photo in photos {
            let currentModel = PhotoModel(url: photo.urls?.small ?? "",
                                          id: photo.id,
                                          userName: photo.user?.id ?? "",
                                          userId: photo.user?.id,
                                          userBio: photo.user?.bio)
            models.append(currentModel)
        }
        return models
    }
}
