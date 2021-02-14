//
//  ContactContactPresenter.swift
//  Coding Challenge App
//
//  Created by david on 14/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

class ContactPresenter: ContactModuleInput, ContactViewOutput, ContactInteractorOutput {
    
    weak var view: ContactViewInput!
    var interactor: ContactInteractorInput!
    var router: ContactRouterInput!

    //MARK: ContactViewOutput
    func viewIsReady() {

    }
    
    func sendInfoToServer(requestObject: ContactRequest) {
        self.validate(request: requestObject)
    }
    
    //MARK: Private functions
    
    private func validate(request: ContactRequest) {
        self.view.showLoader()
        self.interactor.sendDataToServer(requestObject: request)
    }
    
    //MARK: ContactInteractorOutput
    func sendMessageSucceded() {
        self.view.hideLoader()
        self.view.showMessage(title: "",
                              message: Constants.Strings.Alerts.sentMessage)
    }
    func sendMessageFailed(error: String) {
        self.view.hideLoader()
        self.view.showMessage(title: Constants.Strings.Alerts.errorTitle,
                              message: error)
    }
}
