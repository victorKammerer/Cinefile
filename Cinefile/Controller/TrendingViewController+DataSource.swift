//
//  TrendingViewController+DataSource.swift
//  Cinefile
//
//  Created by vko on 19/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if page == Optional(0) {
            return trendingMoviesToday.count
        }
        else {
            return trendingMoviesWeek.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if page == Optional(0) {
            let cell = trendingTableView.dequeueReusableCell(withIdentifier: "trendingTableCell", for: indexPath) as? TrendingTableViewCell
            
            let year: String = "\(trendingMoviesToday[indexPath.item].releaseDate.prefix(4))"
            
            let movie = trendingMoviesToday[indexPath.item]
            
            cell?.setup(title: movie.title,
                        year: year,
                        image: UIImage())
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let image: UIImage = UIImage(data: imageData) ?? UIImage()
                
                cell?.setup(title: movie.title,
                            year: year,
                            image: image)
            }
            return cell ?? TrendingTableViewCell()
        }
        else {
            let cell = trendingTableView.dequeueReusableCell(withIdentifier: "trendingTableCell", for: indexPath) as? TrendingTableViewCell
            
            let year: String = "\(trendingMoviesWeek[indexPath.item].releaseDate.prefix(4))"
            
            let movie = trendingMoviesWeek[indexPath.item]
            
            cell?.setup(title: movie.title,
                        year: year,
                        image: UIImage())
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let image: UIImage = UIImage(data: imageData) ?? UIImage()
                
                cell?.setup(title: movie.title,
                            year: year,
                            image: image)
            }
            return cell ?? TrendingTableViewCell()
        }
    }

}
