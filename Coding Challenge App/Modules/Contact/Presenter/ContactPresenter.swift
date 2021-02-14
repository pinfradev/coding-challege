//
//  ContactContactPresenter.swift
//  Coding Challenge App
//
//  Created by david on 14/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//
import SwiftValidator
class ContactPresenter: ContactModuleInput, ContactViewOutput, ContactInteractorOutput {
    
    weak var view: ContactViewInput!
    var interactor: ContactInteractorInput!
    var router: ContactRouterInput!

    //MARK: Properties
    let validator = Validator()
    var currentRequest: ContactRequest?
    //MARK: ContactViewOutput
    func viewIsReady() {
        self.setupValidator()
        
    }
    
    func sendInfoToServer(requestObject: ContactRequest) {
        self.currentRequest = requestObject
        self.validate()
    }
    
    //MARK: Private functions
    
    private func validate() {
        self.validator.validate(self)
    }
    
    private func setupValidator() {
        guard let vc =  self.view as? ContactViewController else {
           return
        }
        self.validator.registerField(vc.nameTextField, rules: [RequiredRule(message: "full name is required"), FullNameRule()])
        self.validator.registerField(vc.birthDateTextField, rules: [RequiredRule(message: "birthdate required")])
        self.validator.registerField(vc.emailTextField, rules: [RequiredRule(message: "mail required"), EmailRule()])
        self.validator.registerField(vc.messageTextView, rules: [RequiredRule(message: "message is required")])
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

extension ContactPresenter: ValidationDelegate {
    func validationSuccessful() {
        guard let request = self.currentRequest else {
            return
        }
        self.view.showLoader()
        self.interactor.sendDataToServer(requestObject: request)
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        let error = errors.first?.1.errorMessage ?? "Error de validacion"
        self.view.showMessage(title: Constants.Strings.Alerts.errorTitle,
                              message: error)
    }
    
    
}
