//
//  FavoritesFavoritesRouterInput.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import Foundation

protocol FavoritesRouterInput {
    func goToImageDetail(object: PhotoModel,
                         from viewController: FavoritesViewInput,
                         imageData: Data?)
}
