//
//  HomeHomeViewOutput.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//
import Foundation

protocol HomeViewOutput {

    func viewIsReady()
    
    func getImages()
    
    func goToImageDetail(object: PhotoModel, imageData: Data?)
    
    func getMoreImages()
}
