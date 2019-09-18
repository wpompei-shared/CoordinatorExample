import Foundation

import UIKit

protocol CoordinatorFlow {
    
    var navigationController: UINavigationController { get }
    var viewModelFactory: ViewModelFactory { get }
    init( navigationController: UINavigationController, viewModelFactory: ViewModelFactory)
    
    func showDetail()
}
