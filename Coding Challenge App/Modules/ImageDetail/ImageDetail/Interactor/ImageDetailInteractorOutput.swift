//
//  ImageDetailImageDetailInteractorOutput.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import Foundation

protocol ImageDetailInteractorOutput: class {

    func localSaveSucceded()
    func localSaveFailed(error: String?)
    func localDeleteSucceded()
    func localDeleteFailed()
}
