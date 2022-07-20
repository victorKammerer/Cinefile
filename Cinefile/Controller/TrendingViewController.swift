//
//  TrendingViewController.swift
//  Cinefile
//
//  Created by vko on 19/07/22.
//

import UIKit

class TrendingViewController: UIViewController {

    var trendingMoviesToday: [Movie] = []
    var trendingMoviesWeek: [Movie] = []
    
    var page: Int!
    
    @IBOutlet weak var trendingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        page = 0
        
        trendingTableView.dataSource = self
        trendingTableView.delegate = self
        
        Task {
                trendingMoviesToday = await Movie.MoviesAPI(section: "trending/movie/week")
                self.trendingTableView.reloadData()

                trendingMoviesWeek = await Movie.MoviesAPI(section: "trending/movie/day")
                self.trendingTableView.reloadData()
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    @IBAction func switchSegmentedControl (_ sender: UISegmentedControl) {
        page = sender.selectedSegmentIndex
    }
    
}
