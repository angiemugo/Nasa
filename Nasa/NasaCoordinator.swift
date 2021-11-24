//
//  NasaCoordinator.swift
//  Nasa
//
//  Created by Angie Mugo on 22/11/2021.
//

import UIKit

class NasaCoordinator {
    var navigationController: UINavigationController

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() -> UIViewController {
        let viewModel = ImagesListViewModel(RemoteDataSource())
        viewModel.setCoordinator(self)
        let viewController = ImagesListViewController(viewModel)
        return viewController
    }

    func showDetail(_ model: UIModel, _ navigationController: UINavigationController) {
        let viewController = ImageDetailViewController(model)
        navigationController.pushViewController(viewController, animated: true)
    }
}
