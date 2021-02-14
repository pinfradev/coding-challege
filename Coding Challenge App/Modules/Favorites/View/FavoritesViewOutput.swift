//
//  FavoritesFavoritesViewOutput.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//
import Foundation

protocol FavoritesViewOutput {

    /**
        @author david
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    func goToImageDetail(object: PhotoModel, imageData: Data?)
}
