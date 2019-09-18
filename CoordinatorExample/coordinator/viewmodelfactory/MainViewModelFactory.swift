import Foundation

class MainViewModelFactory: ViewModelFactory{
    
    func masterViewModel() -> MasterViewModel {
        return MasterViewModel()
    }
}
