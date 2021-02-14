//
//  ImageDetailImageDetailInitializer.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import UIKit

class ImageDetailModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var imagedetailViewController: ImageDetailViewController!

    override func awakeFromNib() {

        let configurator = ImageDetailModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: imagedetailViewController)
    }

}
