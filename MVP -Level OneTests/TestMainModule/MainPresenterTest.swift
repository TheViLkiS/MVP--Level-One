//
//  MainPresenterTest.swift
//  MVP -Level OneTests
//
//  Created by Дмитрий Гусев on 05.05.2023.
//

import XCTest
@testable import MVP__Level_One

class MockView: MainViewProtocol {
    func succes() {
        
    }
    func failure(error: Error) {
        
    }
}

class MockNetworkService: NetworkServiceProtocol {
    
    var comments: [Comment]!
    
    init() { }
    
    convenience init(comments: [Comment]?) {
        self.init()
        self.comments = comments
    }
    
    func getComments(completion: @escaping (Result<[MVP__Level_One.Comment]?, Error>) -> Void) {
        if let comments = comments {
            completion(.success(comments))
        } else {
            let error = NSError(domain: "", code: 0)
            completion(.failure(error))
        }
    }
}


final class MainPresenterTest: XCTestCase {
    var view: MockView!
    var presenter: MainPresenter!
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    var comments = [Comment]()



    override func setUpWithError() throws {
        let nav = UINavigationController()
        let assembly = AssemblyModelBuilder()

        router = Router(navigationController: nav, assemblyBuilder: assembly)
        
    }

    override func tearDownWithError() throws {
        view = nil
        presenter = nil
        networkService = nil
    }

    func testGetSuccessComents() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Bar", body: "Baz")
        comments.append(comment)
        
        view = MockView()
        networkService = MockNetworkService(comments: [comment])
        presenter = MainPresenter(view: view, netwokrService: networkService, router: router)
        
        var catchComments: [Comment]?
        
        networkService.getComments { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let comments):
                catchComments = comments
            }
        }
        
        XCTAssertNotEqual(catchComments?.count, 0)
    }
    
    func testGetFailureComents() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Bar", body: "Baz")
        comments.append(comment)
        
        view = MockView()
        networkService = MockNetworkService()
        presenter = MainPresenter(view: view, netwokrService: networkService, router: router)
        
        var catchError: Error?
        
        networkService.getComments { result in
            switch result {
            case .failure(let error):
                catchError = error
            case .success:
                break
            }
        }
        
    XCTAssertNotNil(catchError)
    }
}
