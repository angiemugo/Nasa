//
//  BaseViewController.swift
//  Nasa
//
//  Created by Angie Mugo on 21/11/2021.
//

import UIKit
import RxCocoa
import RxSwift

class BaseViewController: UIViewController {
    var disposeBag = DisposeBag()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
