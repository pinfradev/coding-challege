//
//  HomeHomeRouterInput.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import Foundation
import UIKit

protocol HomeRouterInput {
    func goToImageDetail(object: PhotoModel,
                         from viewController: HomeViewInput,
                         imageData: Data?)
}
