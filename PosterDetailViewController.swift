//
//  PosterDetailViewController.swift
//  Flixster 3
//
//  Created by Nhi Huynh on 3/14/23.
//

import UIKit
import Nuke

class PosterDetailViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieVotesAverageLabel: UILabel!
    @IBOutlet weak var movieVotesCountLabel: UILabel!
    @IBOutlet weak var moviePopularityLabel: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    var poster: Poster!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let combinedBackdrop = "\(poster.baseUrlString)\(poster.backdrop_path)"
        
        // Load image async via Nuke library image loading helper method
        Nuke.loadImage(with: URL(string: combinedBackdrop)!, into: movieImageView)
        
        // Set labels with the associated track values.
        movieTitleLabel.text = poster.original_title
        movieOverview.text = poster.overview
        
        //double
        movieVotesAverageLabel.text = String(poster.vote_average)
        
        //int
        movieVotesCountLabel.text = String(poster.vote_count)
        
        //double
        moviePopularityLabel.text = String(poster.popularity)
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
