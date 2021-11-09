//
//  GetMovieListServiceMocks.swift
//  MovieListTests
//
//  Created by douglas.fernandes on 09/11/21.
//

import XCTest
@testable import MovieList

enum ServicesMocks {
    static var movieList = MovieListEntity(titles: [
        .init(id: "1", title: "Harry Potter e a Pedra Filosofal", image: "imageURL"),
        .init(id: "2", title: "Harry Potter e a Camara Secreta", image: "imageURL"),
        .init(id: "1", title: "Harry Potter e o Prisioneiro de Azkaban ", image: "imageURL"),
        .init(id: "1", title: "Harry Potter e o Cálice de Fogo", image: "imageURL"),
        .init(id: "1", title: "Harry Potter e o Enigma do Principe", image: "imageURL"),
        .init(id: "1", title: "Harry Potter e as Relíquias da Morte parte 1", image: "imageURL"),
        .init(id: "1", title: "Harry Potter e as Relíquias da Morte parte 2", image: "imageURL")
    ])
}
