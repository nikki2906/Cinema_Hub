//
//  PosterCell.swift
//  Flixster 3
//
//  Created by Nhi Huynh on 3/13/23.
//

import UIKit
import Nuke

class PosterCell: UICollectionViewCell {
    
    @IBOutlet weak var PosterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    /// Configures the cell's UI for the given track.
    func configure(with poster: Poster) {
        

        //Combine the base url and the Poster Path into one string
        let combinedPoster = "\(poster.baseUrlString)\(poster.poster_path)"
        
        // Load image async via Nuke library image loading helper method
        Nuke.loadImage(with: URL(string: combinedPoster)!, into: PosterImageView)
    }
    
}
