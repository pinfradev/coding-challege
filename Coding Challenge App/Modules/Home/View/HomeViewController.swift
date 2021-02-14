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

    @IBOutlet weak var imageCollectionView: ImagesCollectionView! {
        didSet {
            self.imageCollectionView.delegate = self
        }
    }
    
    //MARK:- Properties
    var output: HomeViewOutput!
    var paginationManager: VerticalPaginationManager?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    //MARK: HomeViewInput methods
    func showImages(data: [PhotoModel]) {
        self.imageCollectionView.reloadCollection(with: data)
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
    
    func setupPagination() {
        self.paginationManager = VerticalPaginationManager(scrollView: self.imageCollectionView.collectionView)
        self.paginationManager?.delegate = self
    }
    
    func showMoreImages(data: [PhotoModel]) {
        self.imageCollectionView.loadMoreItems(items: data)
    }
 
}

extension HomeViewController: ImageCollectionDelegate {
    func didselect(item: PhotoModel, imageData: Data?) {
        self.output.goToImageDetail(object: item, imageData: imageData)
        self.paginationManager?.delegate = self
    }

}

extension HomeViewController: VerticalPaginationManagerDelegate {
    
    func refreshAll(completion: @escaping (Bool) -> Void) {
        self.output.getImages()
        completion(true)
    }
    
    func loadMore(completion: @escaping (Bool) -> Void) {
        self.output.getMoreImages()
        completion(true)
    }
    
    
}
