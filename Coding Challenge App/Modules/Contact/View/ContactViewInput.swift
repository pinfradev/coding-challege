//
//  ContactContactViewInput.swift
//  Coding Challenge App
//
//  Created by david on 14/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

protocol ContactViewInput: class {

    func showMessage(title: String, message: String)
    func showLoader()
    func hideLoader()
    func cleanFields()
}
