//
//  ModuleBuilder.swift
//  MVP -Level One
//
//  Created by Дмитрий Гусев on 04.05.2023.
//

import UIKit


protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModelBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let model = Person(firstName: "David", lastName: "Blaine")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        
        return view
    }
    
    
}
