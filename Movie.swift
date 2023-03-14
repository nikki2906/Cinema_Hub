//
//  Movie.swift
//  Flixster 3
//
//  Created by Nhi Huynh on 3/7/23.
//

import Foundation

// TODO: Pt 1 - Create a Movies model struct
struct Movie : Decodable {
    let original_title: String
    let overview: String
    let poster_path: URL
    let UrlString = "https://image.tmdb.org/t/p/original"
    let vote_average: Double
    let vote_count: Int
    let popularity: Double
}

struct MoviesResponse: Decodable{
  let results : [Movie]
}
// TODO: Pt 1 - Create an extension with a mock mmovies static var





