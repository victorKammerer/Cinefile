//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  Cinefile
//
//  Created by vko on 12/07/22.
//

import UIKit

extension FeaturedViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.popularCollectionView {
            return popularMovies.count
        }
        else if collectionView == self.nowPlayingCollectionView {
            return nowPlayingMovies.count
        }
        else {
            return 0
        }
            
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell
        
        Cell?.titleLabel.text = popularMovies[indexPath.item].title
        Cell?.image.image = UIImage(named: popularMovies[indexPath.item].backdrop)
        
        return Cell ?? UICollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as? NowPlayingCollectionViewCell
        
        Cell?.titleLabel.text = nowPlayingMovies[indexPath.item].title
        Cell?.dateLabel.text = nowPlayingMovies[indexPath.item].releaseDate
        Cell?.image.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
        
        return Cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.popularCollectionView {
            return makePopularCell(indexPath)
        }
        else if collectionView == self.nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        }
        else {
            return UICollectionViewCell()
        }
        
    }
    

}
