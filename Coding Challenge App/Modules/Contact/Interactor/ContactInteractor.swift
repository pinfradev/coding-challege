//
//  ContactContactInteractor.swift
//  Coding Challenge App
//
//  Created by david on 14/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

class ContactInteractor: ContactInteractorInput {

    weak var output: ContactInteractorOutput!

    //MARK: ContactInteractorInput
    func sendDataToServer(requestObject: ContactRequest) {
        ContactAPI.sharedAPI.sendContactMessage(request: requestObject) { (result) in
            switch result {
            case .success:
                self.output.sendMessageSucceded()
            case .failure(let error):
                self.output.sendMessageFailed(error: error.localizedDescription)
            }
        }
    }
}
