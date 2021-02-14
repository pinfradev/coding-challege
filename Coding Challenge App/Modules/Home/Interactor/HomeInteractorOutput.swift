//
//  HomeHomeInteractorOutput.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import Foundation

protocol HomeInteractorOutput: class {

    func getImagesSucceded(data: [PhotoModel])
    func getImagesFailed(error: String)
    
    func getMoreImagesSucceded(data: [PhotoModel])
    func getMoreImagesFailed(error: String)
    
}
