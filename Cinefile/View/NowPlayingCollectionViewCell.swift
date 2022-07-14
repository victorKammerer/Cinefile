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
    @IBOutlet var image: UIImageView!
    @IBOutlet var titleLabel: UILabel!
}
