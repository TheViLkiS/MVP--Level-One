//
//  ModuleBuilder.swift
//  MVP -Level One
//
//  Created by Дмитрий Гусев on 04.05.2023.
//

import UIKit


protocol AssemblyBuilderProtocol{
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController

}

class AssemblyModelBuilder: AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let networkService = NetworkService()
        let view = MainViewController()
        let presenter = MainPresenter(view: view, netwokrService: networkService, router: router)
        view.presenter = presenter
        
        return view
    }
    
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let networkService = NetworkService()
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, networkService: networkService, router: router, comment: comment)
        view.presenter = presenter
        
        return view
    }
}
