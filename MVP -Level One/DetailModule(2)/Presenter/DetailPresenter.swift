//
//  DetailPresenter.swift
//  MVP -Level One
//
//  Created by Дмитрий Гусев on 07.05.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?)
    func setComment()
    func tap()
}


class DetailPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    var router: RouterProtocol?
    let netwokrService: NetworkServiceProtocol!
    var comment: Comment?
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.netwokrService = networkService
        self.comment = comment
        self.router = router
    }
    
   public func setComment() {
       self.view?.setComment(comment: comment)
    }
    func tap() {
        router?.popToRoot()
    }

}
