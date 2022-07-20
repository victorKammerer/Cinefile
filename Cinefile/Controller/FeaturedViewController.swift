//
//  FeaturedViewController.swift
//  Cinefile
//
//  Created by vko on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    var popularMovies: [Movie] = []
    var nowPlayingMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    

    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        
        nowPlayingCollectionView.dataSource = self
        nowPlayingCollectionView.delegate = self
        
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
        
        Task {
            popularMovies = await Movie.MoviesAPI(section: "movie/popular")
            self.popularCollectionView.reloadData()
            
            nowPlayingMovies = await Movie.MoviesAPI(section: "movie/now_playing")
            self.nowPlayingCollectionView.reloadData()
            
            upcomingMovies = await Movie.MoviesAPI(section: "movie/upcoming")
            self.upcomingCollectionView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
}

