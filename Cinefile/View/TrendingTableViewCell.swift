//
//  TrendingTableViewCell.swift
//  Cinefile
//
//  Created by vko on 19/07/22.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {


    @IBOutlet var trendingLabel: UILabel!
    @IBOutlet var trendingDateLabel: UILabel!
    @IBOutlet var trendingImage: UIImageView!
    
    func setup(title: String, year: String, image: UIImage) {
        trendingLabel.text = title
        trendingDateLabel.text = year
        trendingImage.image = image
    }
}
