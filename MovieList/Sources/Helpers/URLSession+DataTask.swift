//
//  URLSession+Extensions.swift
//  MovieList
//
//  Created by douglas.fernandes on 07/11/21.
//

import Foundation

extension URLSession {
    func dataTask(
        with url: URLRequest,
        handler: @escaping (Result<Data, Error>) -> Void
    ) -> URLSessionDataTask {
        dataTask(with: url) { data, _, error in
            if let error = error {
                handler(.failure(error))
            } else {
                handler(.success(data ?? Data()))
            }
        }
    }
}
