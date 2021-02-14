//
//  ContactContactInitializer.swift
//  Coding Challenge App
//
//  Created by david on 14/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import UIKit

class ContactModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var contactViewController: ContactViewController!
    
    
    
    override func awakeFromNib() {

        let configurator = ContactModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: contactViewController)
    }

}
