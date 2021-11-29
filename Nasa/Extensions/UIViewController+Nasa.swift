//
//  UIViewController+Nasa.swift
//  Nasa
//
//  Created by Angie Mugo on 22/11/2021.
//

import UIKit

extension UIViewController {
    func showLoading() {
        view.showLoading()
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.view.hideLoading()
        }
    }
    
    func showError(_ error: Error, _ retry: @escaping () -> Void) {
        let alert = UIAlertController(title: "That didn't work!", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "Retry", style: .default) {_ in
            retry()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
