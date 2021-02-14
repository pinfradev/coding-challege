//
//  FavoritesFavoritesInteractor.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

class FavoritesInteractor: FavoritesInteractorInput {
    

    weak var output: FavoritesInteractorOutput!
    
    var localDataManager = LocalDataManager()

    func getLocalPhotos()  {
        let photos = localDataManager.getLocalPhotos()
        self.output.gotPhotosSuccesfully(photos: photos)
    }
}
