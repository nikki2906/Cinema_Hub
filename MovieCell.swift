//
//  MovieCell.swift
//  Flixster 3
//
//  Created by Nhi Huynh on 3/7/23.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {
    
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with movie: Movie) {
        movieTitleLabel.text = movie.original_title
        movieOverview.text = movie.overview
        
        let image = "\(movie.UrlString)\(movie.poster_path)"
        
        Nuke.loadImage(with: URL(string: image)!, into: movieImageView)
        
    }

}
