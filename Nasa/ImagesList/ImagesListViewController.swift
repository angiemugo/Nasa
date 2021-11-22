//
//  ImagesListViewController.swift
//  Nasa
//
//  Created by Angie Mugo on 21/11/2021.
//

import Foundation
import UIKit

final class ImagesListViewController: BaseViewController {
    private let viewModel: ImagesListViewModel

    init(_ viewModel: ImagesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: ControllerIds.imagesListViewController.rawValue, bundle: Bundle.main)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
