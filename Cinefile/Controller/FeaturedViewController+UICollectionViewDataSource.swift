//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  Cinefile
//
//  Created by vko on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.popularCollectionView {
            return popularMovies.count
        }
        else if collectionView == self.nowPlayingCollectionView {
            return nowPlayingMovies.count
        }
        else if collectionView == self.upcomingCollectionView{
            return upcomingMovies.count
        }
        else {
            return 0
        }
            
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.popularCollectionView {
            return makePopularCell(indexPath)
        }
        else if collectionView == self.nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        }
        else if collectionView == self.upcomingCollectionView{
            return makeUpcomingCell(indexPath)
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let Cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell
        
        let movie = popularMovies[indexPath.item]
        Cell?.setup(title: movie.title, image: UIImage())
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let image: UIImage = UIImage(data: imageData) ?? UIImage()
            
            Cell?.setup(title: movie.title, image: image)
        }
        
        return Cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        let Cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell
        
        let year: String = "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))"
        
        let movie = nowPlayingMovies[indexPath.item]
        
        Cell?.setup(title: movie.title,
                    year: year,
                    image: UIImage())
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let image: UIImage = UIImage(data: imageData) ?? UIImage()
            
            Cell?.setup(title: movie.title,
                        year: year,
                        image: image)
        }
        
        
        return Cell ?? NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        let Cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
        
        let year: String = "\(upcomingMovies[indexPath.item].releaseDate.prefix(4))"
        
        let movie = upcomingMovies[indexPath.item]
        
        Cell?.setup(title: movie.title,
                    year: year,
                    image: UIImage())
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let image: UIImage = UIImage(data: imageData) ?? UIImage()
            
            Cell?.setup(title: movie.title,
                        year: year,
                        image: image)
            
        }
        
        return Cell ?? UpcomingCollectionViewCell()
    }
    

}
