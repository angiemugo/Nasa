//
//  ImageCell.swift
//  Nasa
//
//  Created by Angie Mugo on 21/11/2021.
//

import UIKit

final class ImageCell: UITableViewCell {
    @IBOutlet private weak var nasaImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!

    func configureCell(_ model: UIModel) {
        guard let url = URL(string: model.imageUrl) else { return }
        nasaImage.setImage(url)
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }
}
