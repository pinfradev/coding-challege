//
//  ContactContactConfigurator.swift
//  Coding Challenge App
//
//  Created by david on 14/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import UIKit

class ContactModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ContactViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ContactViewController) {

        let router = ContactRouter()

        let presenter = ContactPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ContactInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
