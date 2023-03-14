//
//  DetailViewController.swift
//  Flixster 3
//
//  Created by Nhi Huynh on 3/7/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    var movie: Movie!
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieVotesAverageLabel: UILabel!
    @IBOutlet weak var movieVotesCountLabel: UILabel!
    @IBOutlet weak var moviePopularityLabel: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let detail = "\(movie.UrlString)\(movie.poster_path)"
                
        Nuke.loadImage(with: URL(string: detail)!, into: movieImageView)
        movieTitleLabel.text = movie.original_title
        movieVotesAverageLabel.text=String("\(movie.vote_average) Vote Average")
        movieVotesCountLabel.text = String("\(movie.vote_count) Votes")
        moviePopularityLabel.text = String("\(movie.popularity) Popularity")
        movieOverview.text = movie.overview

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
