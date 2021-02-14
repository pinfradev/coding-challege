//
//  FavoritesFavoritesRouter.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//
import UIKit
class FavoritesRouter: FavoritesRouterInput {

    func goToImageDetail(object: PhotoModel,
                         from viewController: FavoritesViewInput,
                         imageData: Data?) {
        guard let vc = VCFactory.getViewController(.imageDetail) as? ImageDetailViewController,
              let previousVC = viewController as? UIViewController else {
            return
        }
        vc.currentPhoto = object
        vc.imageData = imageData
        vc.previousVC = .favorites
        previousVC.navigationController?.pushViewController(vc, animated: true)
    }
}
