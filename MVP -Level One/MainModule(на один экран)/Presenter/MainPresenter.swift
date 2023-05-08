//
//  MainPresenter.swift
//  MVP -Level One
//
//  Created by Дмитрий Гусев on 04.05.2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
 
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, netwokrService: NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    var comments: [Comment]? {get set}
    func tapOneTheComment(comment: Comment?)
}

class MainPresenter: MainViewPresenterProtocol {

    
    
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    let netwokrService: NetworkServiceProtocol!
    var comments: [Comment]?
    
    required init(view: MainViewProtocol, netwokrService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.netwokrService = netwokrService
        self.router = router
        getComments()
    }
    func getComments() {
        netwokrService.getComments { [weak self] result in
            guard let self = self else {return}
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func tapOneTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }
   
}
