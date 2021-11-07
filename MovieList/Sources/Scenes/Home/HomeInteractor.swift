//
//  HomeInteractor.swift
//  MovieList
//
//  Created by douglas.fernandes on 06/11/21.
//

import Foundation

protocol HomeBusinessLogic {
    func onDidType(searchTerm: String)
}

final class HomeInteractor {
    
    // MARK: - Properties
    
    private var timer: Timer?
    
    // MARK: - Dependencies
    
    private let presenter: HomePresentationLogic
    private let service: GetMovieListServiceProtocol
    
    // MARK: - Initializers
    
    init(
        presenter: HomePresentationLogic,
        service: GetMovieListServiceProtocol
    ) {
        self.presenter = presenter
        self.service = service
        
    }
    
    private func removeSpaces(_ text: String) -> String {
        return text.filter({$0 != " "})
    }
}

extension HomeInteractor: HomeBusinessLogic {
    func onDidType(searchTerm: String) {
        let formattedSearchTerm = removeSpaces(searchTerm)
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            self.service.getMovieList(with: formattedSearchTerm) { result in
                switch result {
                case .success(let resultData):
                    self.presenter.presentMovieList(with: resultData)
                case .failure(let error):
                    debugPrint(error)
                }
            }
        })
    }
    
}
