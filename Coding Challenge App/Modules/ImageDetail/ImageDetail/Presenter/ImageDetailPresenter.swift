//
//  ImageDetailImageDetailPresenter.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

class ImageDetailPresenter: ImageDetailModuleInput, ImageDetailViewOutput, ImageDetailInteractorOutput {
    

    weak var view: ImageDetailViewInput!
    var interactor: ImageDetailInteractorInput!
    var router: ImageDetailRouterInput!

    //MARK: - ImageDetailViewOutput
    func viewIsReady() {
        self.view.showImageInformation()
    }
    
    func saveLocalPhoto(photo: PhotoModel) {
        
    }
}
