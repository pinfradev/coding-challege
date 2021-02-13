//
//  ImageDetailImageDetailConfigurator.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import UIKit

class ImageDetailModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ImageDetailViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ImageDetailViewController) {

        let router = ImageDetailRouter()

        let presenter = ImageDetailPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ImageDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
