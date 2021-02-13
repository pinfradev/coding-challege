//
//  HomeHomeInteractorInput.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import Foundation

protocol HomeInteractorInput {

    //MARK: Properties
    var page: Int {get set}
    var size: Int {get}
    //MARK: Functions
    func getImages()
}
