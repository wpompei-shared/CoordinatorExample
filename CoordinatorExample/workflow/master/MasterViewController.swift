import UIKit

import RxSwift
import RxCocoa
import RxGesture

class MasterViewController: UIViewController {
    
    @IBOutlet weak var showDetailButton: UIButton!
    
    let disposeBag = DisposeBag()
    
    var viewModel: MasterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupRx()
    }
    
    private func setupRx(){
        showDetailButton.rx.tapGesture()
            .when(.recognized)
            .map { _ in ()}
            .bind(to: viewModel.detail)
            .disposed(by: disposeBag)
    }
}

