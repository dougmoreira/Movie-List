//
//  HomeInteractorTests.swift
//  MovieListTests
//
//  Created by douglas.fernandes on 08/11/21.
//

import XCTest
@testable import MovieList

final class HomeInteractorTests: XCTestCase {
    
    // MARK: - Helpers
    
    private let presenterSpy = HomePresenterSpy()
    private let serviceMock = GetMovieListServiceMock()
    private let expectedMovieListModel = ServicesMocks.movieList
    
    // MARK: - Tests

    func didTypeSearchTerm_WhenResultSuccess_ShouldPresentMovieList() {
        // Given
        let sut = HomeInteractor(presenter: presenterSpy, service: serviceMock)
        
        // When
        serviceMock.movieListResult = .success(expectedMovieListModel)
        sut.onDidType(searchTerm: "Harry Potter")
        
        // Than
        XCTAssertEqual(presenterSpy.didCallPresentMovieList, true)
        XCTAssertEqual(presenterSpy.movieList, expectedMovieListModel)

    }
    
    func didTypeSearchTerm_WhenResultFailure_ShouldPresentError() {
        // Given
        let sut = HomeInteractor(presenter: presenterSpy, service: serviceMock)
        
        // When
        serviceMock.movieListResult = .failure(.serverError(nil))
        sut.onDidType(searchTerm: "Matrix")
        
        // Than
        XCTAssertEqual(presenterSpy.didCallPresentErrorView, true)

        
    }
    
}

final class HomePresenterSpy: HomePresentationLogic {
    private(set) var didCallPresentMovieList = false
    private(set) var didCallPresentErrorView = false
    private(set) var movieList: MovieListEntity?
    
    func presentMovieList(with data: MovieListEntity) {
        didCallPresentMovieList = true
        movieList = data
    }
    
    func presentErrorView() {
        didCallPresentErrorView = true
    }
    
}

final class GetMovieListServiceMock: GetMovieListServiceProtocol {
    private(set) var didCallGetMovieListService = false
    
    var movieListResult: (Result<MovieListEntity, GetMoviesError>)?
    
    func getMovieList(with searchTerm: String, than handle: @escaping (Result<MovieListEntity, GetMoviesError>) -> Void) {
        didCallGetMovieListService = true
        
        guard let movieListResult = movieListResult else {
            XCTFail("Movie List must be initialized")
            return
        }
        
        handle(movieListResult)

    }
}
