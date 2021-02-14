//
//  ImagesCollectionView.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 13/2/21.
//

import UIKit
protocol ImageCollectionDelegate {
    func didselect(item: PhotoModel, imageData: Data?)
}

class ImagesCollectionView: UIView {
    
    //MARK: - properties
    var delegate: ImageCollectionDelegate?
    
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
        self.reloadData()
    }
    
    func loadMoreItems(items: [PhotoModel]) {
        self.photos += items
        self.reloadData()
    }
    
    func reloadData() {
        self.collectionView.reloadData()
    }

}

extension ImagesCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.photoCollectionView,
                                                            for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(imageString: self.photos[indexPath.row].url)
        return cell
    }
    
    
}

extension ImagesCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let currentCell = collectionView.cellForItem(at: indexPath) as? PhotoCollectionViewCell else {
            return
        }
        self.delegate?.didselect(item: self.photos[indexPath.row],
                                 imageData: currentCell.imageView.image?.jpegData(compressionQuality: 0.7))
    }
}
