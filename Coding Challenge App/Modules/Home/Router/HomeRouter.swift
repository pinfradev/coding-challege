//
//  HomeHomeRouter.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import UIKit

class HomeRouter: HomeRouterInput {
    func goToImageDetail(object: PhotoModel,
                         from viewController: HomeViewInput,
                         imageData: Data?) {
        guard let vc = VCFactory.getViewController(.imageDetail) as? ImageDetailViewController,
              let previousVC = viewController as? UIViewController else {
            return
        }
        vc.currentPhoto = object
        vc.imageData = imageData
        previousVC.navigationController?.pushViewController(vc, animated: true)
    }

}
