//
//  ImageDetailImageDetailPresenter.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//
import UIKit
class ImageDetailPresenter: ImageDetailModuleInput, ImageDetailViewOutput, ImageDetailInteractorOutput {

    weak var view: ImageDetailViewInput!
    var interactor: ImageDetailInteractorInput!
    var router: ImageDetailRouterInput!

    //MARK: - ImageDetailViewOutput
    func viewIsReady() {
        self.view.showImageInformation()
    }
    
    func saveLocalPhoto(photo: PhotoModel) {
        self.interactor.saveLocalPhoto(photo: photo)
    }
    
    func deleteLocalPhotoWith(id: String) {
        self.interactor.deleteLocalPhotoWith(id: id)
    }
    
    //MARK: ImageDetailInteractorOutput
    func localSaveSucceded() {
        self.view.popViewController()
    }
    
    func localSaveFailed(error: String?) {
        self.view.showMessage(title: Constants.Strings.Alerts.errorTitle, message: error ?? Constants.Strings.Alerts.localSaveError)
    }
    
    func localDeleteSucceded() {
        self.view.popViewController()

    }
    
    func localDeleteFailed() {
        self.view.showMessage(title: "",
                              message: Constants.Strings.Alerts.localDeleteError)
    }
}
