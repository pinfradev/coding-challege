//
//  ImageDetailImageDetailViewInput.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

protocol ImageDetailViewInput: class {

    func showImageInformation()

    func showMessage(title: String, message: String)
    
    func popViewController()
}
