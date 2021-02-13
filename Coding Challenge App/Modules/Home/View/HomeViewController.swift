//
//  HomeHomeViewController.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 12/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, HomeViewInput {
    // MARK: - IBOutlets

    @IBOutlet weak var mainLabelView: MainLabelView! {
        didSet {
            mainLabelView.setupLabelText(with: Constants.Strings.Home.mainTitle)
        }
    }

    @IBOutlet weak var imageCollectionView: ImagesCollectionView!
    
    //MARK:- Properties
    var output: HomeViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    //MARK: HomeViewInput methods
    func showImages(data: [PhotoModel]) {
        print(data)
    }
    
    func showError(error: String) {
        self.showAlert(message: error)
    }
    
    func showLoader() {
        self.showBasicLoader()
    }
    
    func hideLoader() {
        self.hideBasicLoader()
    }
    
    
    
    
}
