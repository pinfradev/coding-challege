//
//  FavoritesFavoritesViewController.swift
//  Coding Challenge App
//
//  Created by david on 13/02/2021.
//  Copyright © 2021 pinfradev. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, FavoritesViewInput {

    var output: FavoritesViewOutput!

    //MARK: IBOutlet
    
    @IBOutlet weak var imagesCollectionView: ImagesCollectionView! {
        didSet {
            self.imagesCollectionView.delegate = self
        }
    }
    @IBOutlet weak var mainLabelView: MainLabelView! {
        didSet {
            mainLabelView.setupLabelText(with: Constants.Strings.Favorite.mainTitle)
        }
    }
    // MARK: Life cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.output.viewIsReady()
    }
    
    func showImages(images: [PhotoModel]) {
        self.imagesCollectionView.reloadCollection(with: images)
    }
}

extension FavoritesViewController: ImageCollectionDelegate {
    func didselect(item: PhotoModel, imageData: Data?) {
        self.output.goToImageDetail(object: item, imageData: imageData)
    }

}
