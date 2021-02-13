//
//  HomeHomePresenter.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//
import Foundation

class HomePresenter: HomeModuleInput, HomeViewOutput, HomeInteractorOutput {
    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!

    //MARK: - HomeViewOutput
    func viewIsReady() {
        self.view.setupPagination()
        self.view.showLoader()
        self.getImages()
    }
    
    func goToImageDetail(object: PhotoModel, imageData: Data?) {
        self.router.goToImageDetail(object: object, from: view, imageData: imageData)
    }
    
    func getImages() {
        self.interactor.getImages()
    }
    
    func getMoreImages() {
        self.view.showLoader()
        self.interactor.getMoreImages()
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
    
    func getMoreImagesSucceded(data: [PhotoModel]) {
        self.view.hideLoader()
        self.view.showMoreImages(data: data)
    }
    func getMoreImagesFailed(error: String) {
        self.view.hideLoader()
        self.view.showError(error: error)
    }
    
    
}
