//
//  BaseViewController.swift
//  Nasa
//
//  Created by Angie Mugo on 21/11/2021.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func showError(_ error: Error, _ handler: ()-> Void) {

    }

    func showLoading(_ show: Bool) {

    }
}
