//
//  GetMovieListEntity.swift
//  MovieList
//
//  Created by douglas.fernandes on 06/11/21.
//

import Foundation

struct MovieListEntity: Decodable {
    let titles: [Title]
}

struct Title: Decodable {
    let id, title: String
    let image: String
}
