//
//  ImagesListViewModel.swift
//  Nasa
//
//  Created by Angie Mugo on 21/11/2021.
//

import Foundation
import RxSwift
import RxRelay

class ImagesListViewModel: BaseViewModel {
    let items = BehaviorRelay(value: [UIModel]())
    let dataSource: DataSource
    var coordinator: NasaCoordinator?

    init(_ dataSource: DataSource) {
        self.dataSource = dataSource
    }

    func setCoordinator(_ nasaCoordinator: NasaCoordinator) {
        self.coordinator = nasaCoordinator
    }

    func fetchItems() {
        items.accept(fetch())
    }

    func fetch() -> [UIModel]{
        var items = [UIModel]()
        loadingRelay.accept(true)
        dataSource.fetchNasaImages().subscribe { images in
            let UIModel = images.collection.items.map { $0.toListUIModel() }
            items = (UIModel)
        } onFailure: { error in
            self.errorRelay.accept(error)
        }.disposed(by: disposeBag)
        return items
    }

    func goToDetail(_ row: Int, _ nav: UINavigationController) {
        coordinator?.showDetail(items.value[row], nav)
    }
}
