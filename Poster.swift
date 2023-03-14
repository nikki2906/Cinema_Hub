//
//  Poster.swift
//  Flixster 3
//
//  Created by Nhi Huynh on 3/12/23.
//

import Foundation
struct PosterSearchResponse: Decodable {
    let results: [Poster]
}

struct Poster: Decodable {
    let backdrop_path: URL
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: URL
    let vote_average: Double
    let vote_count: Int
    let baseUrlString = "https://image.tmdb.org/t/p/original"

}
