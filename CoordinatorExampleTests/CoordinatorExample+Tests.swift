import XCTest

import RxSwift

@testable import CoordinatorExample

class Coordinator_Tests: XCTestCase {
    
    func test_when_onNext_viewModelDetail_then_flow_showDetail() {
        
        // Given
        let navigationController = UINavigationController()
        let viewModelFactory = StubViewModelFactory()
        
        let coordinatorFlow = SpyCoordinatorFlow(navigationController: navigationController
            , viewModelFactory: viewModelFactory)
        
        let coordinator = MainCoordinator(navigationController: navigationController
            , coordinatorFlow: coordinatorFlow
            , viewModelFactory: viewModelFactory)
        
        coordinator.start()
        
        // When
        viewModelFactory.recordedMasterViewModel?.detail.onNext(())
        
        // Then
        XCTAssertEqual(coordinatorFlow.showDetailCalls, 1)
    }
}

/**
 Record every call to coordinator flow.
 
 It's a simple implementation for demonstrational purposes.
 More complex cases may require different code.
 */
class SpyCoordinatorFlow: CoordinatorFlow {
    let viewModelFactory: ViewModelFactory
    let navigationController: UINavigationController
    
    required init(
        navigationController: UINavigationController
        , viewModelFactory: ViewModelFactory) {
        self.navigationController = navigationController
        self.viewModelFactory = viewModelFactory
    }
    
    var showDetailCalls = 0
    func showDetail() {
        showDetailCalls += 1
    }
}

/**
 Record value returned from each method.
 The test class should use the recorded value to get access
 to the view model instance in use by tested code.
 
 It's a simple implementation for demonstrational purposes.
 More complex cases may require different code.
 */
class StubViewModelFactory: ViewModelFactory {
    let factory = MainViewModelFactory()
    
    var recordedMasterViewModel: MasterViewModel?
    func masterViewModel() -> MasterViewModel {
        recordedMasterViewModel = factory.masterViewModel()
        return recordedMasterViewModel!
    }
}
