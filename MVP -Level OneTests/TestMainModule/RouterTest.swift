//
//  RouterTest.swift
//  MVP -Level OneTests
//
//  Created by Дмитрий Гусев on 08.05.2023.
//

import XCTest
@testable import MVP__Level_One

class MockNavigationController: UINavigationController {
    
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
    
}

final class RouterTest: XCTestCase {
    
    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let assembly = AssemblyModelBuilder()

    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)

    }

    override func tearDownWithError() throws {

        router = nil
    }

    func testRouter() {
        router.showDetail(comment: nil)
        let detaitViewController = navigationController.presentedVC
        XCTAssertTrue(detaitViewController is DetailViewController)
    }

}
