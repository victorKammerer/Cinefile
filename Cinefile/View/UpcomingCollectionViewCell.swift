//
//  UpcomingCollectionViewCell.swift
//  Cinefile
//
//  Created by vko on 13/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
        
    static let cellIdentifier = "upcomingCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
}