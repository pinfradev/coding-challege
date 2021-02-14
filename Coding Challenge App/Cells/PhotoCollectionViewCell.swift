//
//  PhotoCollectionViewCell.swift
//  Coding Challenge App
//
//  Created by Fray Pineda on 13/2/21.
//

import UIKit
import Kingfisher


class PhotoCollectionViewCell: UICollectionViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    private func setupUI() {
        self.imageView.layer.cornerRadius = 20.0
        self.imageView.clipsToBounds = true
        self.imageView.contentMode = .scaleAspectFill
    }
    
    func setupCell(imageString: String) {
        guard let url = URL(string: imageString) else {
            return
        }
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url)
    }

}
