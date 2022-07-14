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
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let Cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell
        
        Cell?.titleLabel.text = popularMovies[indexPath.item].title
        Cell?.imageView.image = UIImage(named: popularMovies[indexPath.item].backdrop)
        
        return Cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        let Cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell
        
        Cell?.titleLabel.text = nowPlayingMovies[indexPath.item].title
        let year: String = "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))"
        Cell?.dateLabel.text = year
        Cell?.image.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
        
        return Cell ?? NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        let Cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
        
        Cell?.titleLabel.text = upcomingMovies[indexPath.item].title
        let year: String = "\(upcomingMovies[indexPath.item].releaseDate.prefix(4))"
        Cell?.dateLabel.text = year
        Cell?.imageView.image = UIImage(named: upcomingMovies[indexPath.item].poster)
        
        
        return Cell ?? UpcomingCollectionViewCell()
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
    

}
