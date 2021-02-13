//
//  ImageDetailImageDetailViewController.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import UIKit
import Kingfisher

class ImageDetailViewController: UIViewController, ImageDetailViewInput {
    
    //IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageIdTitleLabel: UILabel! {
        didSet {
            imageIdTitleLabel.setTextWith(string: Constants.Strings.ImageDetail.ImageIdTitle,
                                          font: .roboto,
                                          weight: .light,
                                          size: 14.0)
        }
    }
    @IBOutlet weak var imageIdValueLabel: UILabel! {
        didSet {
            imageIdValueLabel.setTextWith(string: "...",
                                          font: .roboto,
                                          weight: .regular,
                                          size: 12.0)
        }
    }
    @IBOutlet weak var userNameTitleLabel: UILabel! {
        didSet {
            userNameTitleLabel.setTextWith(string: Constants.Strings.ImageDetail.userNameTitle,
                                          font: .roboto,
                                          weight: .medium,
                                          size: 14.0)
        }
    }
    @IBOutlet weak var userNameValueLabel: UILabel! {
        didSet {
            userNameValueLabel.setTextWith(string: "...",
                                          font: .roboto,
                                          weight: .regular,
                                          size: 12.0)
        }
    }
    @IBOutlet weak var bioTitleLabel: UILabel! {
        didSet {
            bioTitleLabel.setTextWith(string: Constants.Strings.ImageDetail.bioTitle,
                                          font: .roboto,
                                          weight: .medium,
                                          size: 14.0)
        }
    }
    @IBOutlet weak var bioDescriptionLabel: UILabel! {
        didSet {
            bioDescriptionLabel.setTextWith(string: "...",
                                          font: .roboto,
                                          weight: .regular,
                                          size: 12.0)
        }
    }
    @IBOutlet weak var mainButton: UIButton! {
        didSet {
            mainButton.setAttributedTitleWith(text: Constants.Strings.ImageDetail.mainButtonTitle,
                                              fontType: .roboto,
                                              weight: .bold,
                                              size: 13.0)
            mainButton.backgroundColor = .black
            mainButton.setTitleColor(.white, for: .normal)
            mainButton.layer.cornerRadius = 20.0
            mainButton.clipsToBounds = true
        }
    }
    @IBOutlet weak var mainLabelView: MainLabelView! {
        didSet {
            mainLabelView.setupLabelText(with: Constants.Strings.ImageDetail.mainTitle)
        }
    }
    
    
    
    //MARK: Properties
    var output: ImageDetailViewOutput!
    var currentPhoto: PhotoModel?
    var imageData: Data?

    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: ImageDetailViewInput
    func showImageInformation() {
        self.imageIdValueLabel.text = self.currentPhoto?.id
        self.userNameValueLabel.text = self.currentPhoto?.userName
        self.bioDescriptionLabel.text = self.currentPhoto?.userBio
        if let data = imageData, let image = UIImage(data: data) {
            self.imageView.image = image
        }
    }
    
    //MARK: IBActions
    

    @IBAction func didTapAddToFavBtn() {
        guard var currentPhoto = self.currentPhoto else {
            return
        }
        currentPhoto.imageData = self.imageData
        self.output.saveLocalPhoto(photo: currentPhoto)
    }
}
