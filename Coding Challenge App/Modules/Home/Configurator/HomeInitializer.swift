//
//  HomeHomeInitializer.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import UIKit

class HomeModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var homeViewController: HomeViewController!
    

    override func awakeFromNib() {

        let configurator = HomeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: homeViewController)
    }

}
