//
//  ImageDetailImageDetailInteractorInput.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import Foundation

protocol ImageDetailInteractorInput {

    var localDataManager: LocalDataManager {get}
    func saveLocalPhoto(photo: PhotoModel)
    func deleteLocalPhotoWith(id: String)
}
