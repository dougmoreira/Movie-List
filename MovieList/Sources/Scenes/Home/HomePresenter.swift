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
}

final class HomePresenter {
    
    // MARK: - Properties
    
    weak var viewController: HomeDisplayLogic?
    
    private func handleMovieListData(with data: MovieListEntity) -> [MovieListModels.ViewData] {
        var viewData: [MovieListModels.ViewData] = []
        
        data.titles.forEach { item in
            viewData.append(.init(name: item.title, urlImage: item.image))
            loadImage(url: URL(string: item.image)!)
        }
        
        return viewData
        
    }
    
    private func loadImage(url: URL) {
        let cache = NSCache<NSString, UIImage>()
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    cache.setObject(image, forKey: url.path as NSString)
                }
                
            }
            
        }
    }
    
}

extension HomePresenter: HomePresentationLogic {
    func presentMovieList(with data: MovieListEntity) {
        let viewData = handleMovieListData(with: data)
        viewController?.displaySearchResult(viewData)
    }

}
