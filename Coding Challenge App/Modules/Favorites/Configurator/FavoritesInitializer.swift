//
//  FavoritesFavoritesInitializer.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import UIKit

class FavoritesModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var favoritesViewController: FavoritesViewController!

    override func awakeFromNib() {

        let configurator = FavoritesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: favoritesViewController)
    }

}
