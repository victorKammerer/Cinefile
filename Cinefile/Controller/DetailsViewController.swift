//
//  DetailsViewController.swift
//  Cinefile
//
//  Created by vko on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var lenghtLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        guard let movie = movie else {
            return
        }

        title = movie.title
        backdropImage.image = UIImage(named: movie.backdropPath)
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.posterPath)
        ratingLabel.text = "Rating: \(movie.voteAverage)/ 10"
        overviewLabel.text = movie.overview
        genreLabel.text = "\(movie.genres?.prefix(2))"
    }


}
