//
//  ImageDetailViewController.swift
//  Nasa
//
//  Created by Angie Mugo on 21/11/2021.
//

import UIKit

final class ImageDetailViewController: BaseViewController {
    @IBOutlet private var nasaImage: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    let model: UIModel

    init(_ model: UIModel) {
        self.model = model
        super.init(nibName: ControllerIds.imageDetailViewController.rawValue, bundle: Bundle.main)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        guard let url = URL(string: model.imageUrl) else { return }
        nasaImage.loadImage(url)
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        descriptionLabel.text = model.description
    }
}
