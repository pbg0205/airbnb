//
//  VariousDestinationCell.swift
//  swift-airbnb
//
//  Created by user on 2021/05/19.
//

import UIKit

class VariousDestinationCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageDescriptionLabel: UILabel!
    
    static let reuseIdentifier = "VariousDestinationCell"
    static var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }

    func configure(model: VariousDestination) {
        let image = UIImage(named: "\(model.destinationImage)")
        self.imageView.image = image
        self.imageDescriptionLabel.text = model.destinationDescription
    }
}
