//
//  ModuleBuilder.swift
//  MVP -Level One
//
//  Created by Дмитрий Гусев on 04.05.2023.
//

import UIKit


protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailModule(comment: Comment?) -> UIViewController

}

class ModelBuilder: Builder {

    
    static func createMainModule() -> UIViewController {
        let networkService = NetworkService()
        let view = MainViewController()
        let presenter = MainPresenter(view: view, netwokrService: networkService)
        view.presenter = presenter
        
        return view
    }
    
    static func createDetailModule(comment: Comment?) -> UIViewController {
        let networkService = NetworkService()
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter
        
        return view
    }
    
    
    
}
