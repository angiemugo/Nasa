//
//  ImageDetailViewController.swift
//  Nasa
//
//  Created by Angie Mugo on 21/11/2021.
//

import UIKit

final class ImageDetailViewController: BaseViewController {
    private let viewModel: ImageDetailViewModel

    init(_ viewModel: ImageDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: ControllerIds.imageDetailViewModel.rawValue, bundle: Bundle.main)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setup() {
        
    }
}
