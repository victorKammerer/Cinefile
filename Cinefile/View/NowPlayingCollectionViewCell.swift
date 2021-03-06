//
//  NowPlayingCollectionViewCell.swift
//  Cinefile
//
//  Created by vko on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "nowPlayingCell"
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    func setup(title: String, year: String, image: UIImage) {
        titleLabel.text = title
        dateLabel.text = year
        imageView.image = image
    }
}
