//
//  FavoritesFavoritesConfigurator.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import UIKit

class FavoritesModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? FavoritesViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: FavoritesViewController) {

        let router = FavoritesRouter()

        let presenter = FavoritesPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = FavoritesInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
