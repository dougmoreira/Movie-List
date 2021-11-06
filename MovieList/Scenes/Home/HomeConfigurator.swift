//
//  HomeConfigurator.swift
//  MovieList
//
//  Created by douglas.fernandes on 06/11/21.
//

import Foundation
import UIKit

protocol HomeConfiguratorProtocol {
    func resolveViewController() -> UIViewController
}
final class HomeConfigurator: HomeConfiguratorProtocol {
    func resolveViewController() -> UIViewController {
        let presenter = HomePresenter()
        let interactor = HomeInteractor(presenter: presenter)
        let router = HomeRouter()
        let viewController = HomeViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    
    }
    
}
