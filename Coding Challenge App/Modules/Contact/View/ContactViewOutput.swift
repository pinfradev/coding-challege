//
//  ContactContactViewOutput.swift
//  Coding Challenge App
//
//  Created by david on 14/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

protocol ContactViewOutput {

    /**
        @author david
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    func sendInfoToServer(requestObject: ContactRequest)
}
