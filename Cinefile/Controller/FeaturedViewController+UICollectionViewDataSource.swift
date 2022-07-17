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
        
        Cell?.setup(title: popularMovies[indexPath.item].title,
                    image: UIImage(named: popularMovies[indexPath.item].backdropPath) ?? UIImage())
        
        return Cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        let Cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell
        
        let year: String = "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))"
        
        Cell?.setup(title: nowPlayingMovies[indexPath.item].title,
                    year: year,
                    image: UIImage(named: nowPlayingMovies[indexPath.item].posterPath) ?? UIImage())
        
        return Cell ?? NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        let Cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
        
        let year: String = "\(upcomingMovies[indexPath.item].releaseDate.prefix(4))"
        
        Cell?.setup(title: upcomingMovies[indexPath.item].title, year: year, image:  UIImage(named: upcomingMovies[indexPath.item].posterPath) ?? UIImage())
 
        
        return Cell ?? UpcomingCollectionViewCell()
    }
    

}
