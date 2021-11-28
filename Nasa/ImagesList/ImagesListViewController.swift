//
//  ImagesListViewController.swift
//  Nasa
//
//  Created by Angie Mugo on 21/11/2021.
//

import Foundation
import UIKit

final class ImagesListViewController: BaseViewController {
    @IBOutlet private var tableView: UITableView!
    private let viewModel: ImagesListViewModel
    
    init(_ viewModel: ImagesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: ControllerIds.imagesListViewController.rawValue, bundle: Bundle.main)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureObservables()
        viewModel.fetch()
        configureView()
    }

    private func configureView() {
        title = "The Milky Way"
        configureTableView()
    }

    private func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(ImageCell.identifier)
        tableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            guard let self = self else { return }
            self.showDetail(indexPath.row)
        }).disposed(by: disposeBag)
        
        viewModel.items.asObservable().bind(to: tableView
                                                .rx
                                                .items) { (cell, row, model) in
            let indexPath = IndexPath(row: row, section: 0)
            return self.configureTableViewCell(indexPath: indexPath, model: model)
        }.disposed(by: disposeBag)
    }
    
    private func showDetail(_ indexPath: Int) {
        guard let nav = navigationController else { return }
        viewModel.goToDetail(indexPath, nav)
    }
    
    private func configureTableViewCell(indexPath: IndexPath, model: UIModel) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell {
            cell.configureCell(model)
            return cell
        }
        return UITableViewCell()
    }
    
    private func configureObservables() {
        viewModel.errorRelay.bind { [weak self] error in
            guard let self = self else { return }
            self.showError(error, self.viewModel.fetch)
        }.disposed(by: disposeBag)
        
        viewModel.loadingRelay.subscribe(onNext: { [weak self] loading in
            guard let self = self else { return }
            loading ? self.showLoading() : self.hideLoading()
        }).disposed(by: disposeBag)
    }
}
