//
//  HomePresenter.swift
//  MovieList
//
//  Created by douglas.fernandes on 06/11/21.
//

import Foundation
import UIKit

protocol HomePresentationLogic {
    func presentMovieList(with data: MovieListEntity)
    func presentErrorView()
}

final class HomePresenter {
    
    // MARK: - Properties
    
    weak var viewController: HomeDisplayLogic?
    
    private func handleMovieListData(with data: MovieListEntity) -> [MovieListModels.ViewData] {
        var viewData: [MovieListModels.ViewData] = []
        
        data.titles.forEach { item in
            viewData.append(.init(name: item.title, urlImage: item.image))
        }
        
        return viewData
    }
}

extension HomePresenter: HomePresentationLogic {
    func presentMovieList(with data: MovieListEntity) {
        let viewData = handleMovieListData(with: data)
        viewController?.displaySearchResult(viewData)
    }
    
    func presentErrorView() {
        //
    }
}
