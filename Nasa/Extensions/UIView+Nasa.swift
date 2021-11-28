//
//  UIView+Nasa.swift
//  Nasa
//
//  Created by Angie Mugo on 22/11/2021.
//

import UIKit


import UIKit

enum Tags {
    enum Loading: Int {
        case defaultLoadingIndicator = 999999
    }
}

extension UIView {
    private var loadingIndicatorView: UIActivityIndicatorView {
        let style: UIActivityIndicatorView.Style = .medium
        let indicatorView = UIActivityIndicatorView(style: style)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        return indicatorView
    }

    func showLoading(tag: Tags.Loading = Tags.Loading.defaultLoadingIndicator, _ backgroundAlpha: CGFloat = 0.3) {
        guard viewWithTag(tag.rawValue) == nil else {
            if let loadingIndicator = viewWithTag(tag.rawValue) as? UIActivityIndicatorView {
                loadingIndicator.startAnimating()
            }
            return
        }

        let height: CGFloat = 45
        let loadingView = loadingIndicatorView
        loadingView.tag = tag.rawValue
        loadingView.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        addSubview(loadingView)

        NSLayoutConstraint.activate([
            loadingView.widthAnchor.constraint(equalToConstant: height),
            loadingView.heightAnchor.constraint(equalTo: loadingView.widthAnchor),
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            loadingView.startAnimating()
        }
    }

    func hideLoading(tag: Tags.Loading =  Tags.Loading.defaultLoadingIndicator) {
        DispatchQueue.main.async {
            while self.viewWithTag(tag.rawValue) != nil {
                self.viewWithTag(tag.rawValue)?.removeFromSuperview()
            }
        }
    }
}
