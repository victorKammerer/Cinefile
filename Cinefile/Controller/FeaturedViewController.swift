//
//  FeaturedViewController.swift
//  Cinefile
//
//  Created by vko on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let popularMovies = Movie.popularMovies()
    let nowPlayingMovies = Movie.nowPlayingMovies()
    

    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        
        nowPlayingCollectionView.dataSource = self
        nowPlayingCollectionView.delegate = self
    }
    
    
}

