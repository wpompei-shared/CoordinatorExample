import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get }
    var coordinatorFlow: CoordinatorFlow { get }
    
    func start()
}
