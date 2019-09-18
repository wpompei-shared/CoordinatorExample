import Foundation

import UIKit

class MainCoordinatorFlow: CoordinatorFlow {

    let navigationController: UINavigationController
    let viewModelFactory: ViewModelFactory
    
    required init(navigationController: UINavigationController, viewModelFactory: ViewModelFactory) {
        self.navigationController = navigationController
        self.viewModelFactory = viewModelFactory
    }
    
    func showDetail() {
        let vc = DetailViewController()
        navigationController.pushViewController(vc, animated: true)
    }
}
