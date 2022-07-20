//
//  TrendingViewController+UITableViewDelegate.swift
//  Cinefile
//
//  Created by vko on 20/07/22.
//

import UIKit

extension TrendingViewController:
    UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie: Movie
        if page == Optional(0) {
            movie = trendingMoviesToday[indexPath.item]
        }
        else {
            movie = trendingMoviesWeek[indexPath.item]
        }
        
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
}
