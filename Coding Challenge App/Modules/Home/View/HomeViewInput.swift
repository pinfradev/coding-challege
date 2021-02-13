//
//  HomeHomeViewInput.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

protocol HomeViewInput: class {

    func showLoader()
    
    func hideLoader()
    
    func showImages(data: [PhotoModel])
    
    func showError(error: String)
}
