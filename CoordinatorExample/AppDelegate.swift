import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var coordinator: Coordinator?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController()
        let viewModelFactory = MainViewModelFactory()
        let coordinatorFlow = MainCoordinatorFlow(navigationController: navigationController, viewModelFactory: viewModelFactory)
        
        coordinator = MainCoordinator( navigationController: navigationController
            , coordinatorFlow: coordinatorFlow
            , viewModelFactory: viewModelFactory)
        coordinator?.start()
        
        window = UIWindow()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

