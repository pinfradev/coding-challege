//
//  ImagesCollectionView.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 13/2/21.
//

import UIKit

class ImagesCollectionView: UIView {
    
    //MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.register(UINib(nibName: "\(PhotoCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(PhotoCollectionViewCell.self)")
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
        }
    }
    @IBOutlet weak var contentView: UIView!
    
    //MARK: Properties
    var photos: [PhotoModel] = []
    //MARK: Initialization
    override init(frame: CGRect) {
        //For using custom view in code
        super.init(frame: frame)
        self.commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        //For using custom in IB
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("\(ImagesCollectionView.self)", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
    }
    
    func reloadCollection(with data: [PhotoModel]) {
        self.photos = data
        self.collectionView.reloadData()
    }

}

extension ImagesCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.photoCollectionView,
                                                      for: indexPath)
        return cell
    }
    
    
}

extension ImagesCollectionView: UICollectionViewDelegate {
    
}
