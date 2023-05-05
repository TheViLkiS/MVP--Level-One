//
//  ViewController.swift
//  MVP -Level One
//
//  Created by Дмитрий Гусев on 04.05.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var greetingLabel: UILabel!
    
    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - IBAction
    @IBAction func didTapButtonAction(_ sender: Any) {
        self.presenter.showGreeting()
    }
}


extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}
