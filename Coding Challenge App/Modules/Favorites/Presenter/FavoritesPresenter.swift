//
//  FavoritesFavoritesPresenter.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import Foundation
class FavoritesPresenter: FavoritesModuleInput, FavoritesViewOutput, FavoritesInteractorOutput {
    

    weak var view: FavoritesViewInput!
    var interactor: FavoritesInteractorInput!
    var router: FavoritesRouterInput!

    func viewIsReady() {
        self.interactor.getLocalPhotos()
    }
    
    func goToImageDetail(object: PhotoModel, imageData: Data?) {
        self.router.goToImageDetail(object: object,
                                    from: view,
                                    imageData: imageData)
    }
    
    //MARK: FavoritesInteractorOutput
    func gotPhotosSuccesfully(photos: [PhotoModel]) {
        self.view.showImages(images: photos)
    }
}
