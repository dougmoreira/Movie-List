//
//  GetMovieListService.swift
//  MovieList
//
//  Created by douglas.fernandes on 06/11/21.
//

import Foundation

protocol GetMovieListServiceProtocol {
    func getMovieList(with searchTerm: String, than handle: @escaping (Result<MovieListEntity, Error>) -> Void)
}

final class GetMovieListService: GetMovieListServiceProtocol {
    func getMovieList(with searchTerm: String, than handle: @escaping (Result<MovieListEntity, Error>) -> Void) {
        let headers = [
            "x-rapidapi-host": "imdb-internet-movie-database-unofficial.p.rapidapi.com",
            "x-rapidapi-key": "311f6a6f13mshba9ef6710d33953p1679e1jsn55b10b6a1b01"
        ]

        let request = NSMutableURLRequest(
            url: NSURL(string: "https://imdb-internet-movie-database-unofficial.p.rapidapi.com/search/\(searchTerm)")! as URL,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0
        )
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(MovieListEntity.self, from: data)
                    handle(.success(decodedData))
                } catch let error {
                    handle(.failure(error))
                }

            case .failure(let error):
                debugPrint(error)
            }
        }
        
        dataTask.resume()
        
    }

}
