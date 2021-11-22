//
//  LoadingView.swift
//  Nasa
//
//  Created by Angie Mugo on 22/11/2021.
//

import UIKit

class LoadingView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }

    private func configureView() {
        backgroundColor = .white
        let acitivyIndicatorView = UIActivityIndicatorView(style: .gray)
        acitivyIndicatorView.hidesWhenStopped = true
        acitivyIndicatorView.style = .medium
        acitivyIndicatorView.color = .darkGray
        acitivyIndicatorView.startAnimating()
        acitivyIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(acitivyIndicatorView)
        NSLayoutConstraint.activate([
            acitivyIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            acitivyIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
}
