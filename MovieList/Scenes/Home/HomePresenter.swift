//
//  HomePresenter.swift
//  MovieList
//
//  Created by douglas.fernandes on 06/11/21.
//

import Foundation

protocol HomePresentationLogic {
    func presentMovieList()
}

final class HomePresenter {
    
    // MARK: - Properties
    
    weak var viewController: HomeDisplayLogic?
    
}

extension HomePresenter: HomePresentationLogic {
    func presentMovieList() {
        
    }
}
