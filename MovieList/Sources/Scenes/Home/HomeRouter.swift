//
//  HomeRouter.swift
//  MovieList
//
//  Created by douglas.fernandes on 06/11/21.
//

import Foundation
import UIKit

protocol HomeRoutingLogic {
    func routeToMovieDetail()
}

final class HomeRouter {
    
    // MARK: - Properties
    
    var viewController: UIViewController?
    
}

extension HomeRouter: HomeRoutingLogic {
    func routeToMovieDetail() {}
}
