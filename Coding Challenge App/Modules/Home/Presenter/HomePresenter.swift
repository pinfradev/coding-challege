//
//  HomeHomePresenter.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

class HomePresenter: HomeModuleInput, HomeViewOutput, HomeInteractorOutput {
    
    

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!

    func viewIsReady() {
        self.view.showLoader()
        self.getImages()
    }
    
    //MARK: HomeInteractorInput
    func getImages() {
        self.interactor.getImages()
    }
    
    //MARK: HomeInteractorOutput
    func getImagesSucceded(data: [PhotoModel]) {
        self.view.hideLoader()
        self.view.showImages(data: data)
    }
    
    func getImagesFailed(error: String) {
        self.view.hideLoader()
        self.view.showError(error: error)
    }
}
