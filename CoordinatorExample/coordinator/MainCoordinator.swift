import UIKit

import RxSwift
import RxCocoa

class MainCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let coordinatorFlow: CoordinatorFlow
    
    let viewModelFactory: ViewModelFactory
    let disposeBag = DisposeBag()
    
    init(navigationController: UINavigationController
        , coordinatorFlow: CoordinatorFlow
        , viewModelFactory: ViewModelFactory) {
        self.navigationController = navigationController
        self.coordinatorFlow = coordinatorFlow
        self.viewModelFactory = viewModelFactory
    }
    
    
    func start() {
        let viewModel = viewModelFactory.masterViewModel()
        let vc = MasterViewController()
        vc.viewModel = viewModel
        
        viewModel.detail
            .subscribe(onNext: { [weak self] _ in
                self?.coordinatorFlow.showDetail()
            })
        .disposed(by: disposeBag)
        
        navigationController.viewControllers = [vc]
    }
}
