//
//  HomeInteractor.swift
//  MovieList
//
//  Created by douglas.fernandes on 06/11/21.
//

import Foundation

protocol HomeBusinessLogic {
    func onDidType(text: String)
}

final class HomeInteractor {
    
    // MARK: - Dependencies
    
    private let presenter: HomePresentationLogic
    
    // MARK: - Initializers
    
    init(presenter: HomePresentationLogic) {
        self.presenter = presenter
        
    }
    

    
}

extension HomeInteractor: HomeBusinessLogic {
    func onDidType(text: String) {
        
    }
}
