//
//  ImageCell.swift
//  Nasa
//
//  Created by Angie Mugo on 21/11/2021.
//

import UIKit

final class ImageCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descLabel: UILabel!

    func configure() {
        titleLabel.text = "ARC-2002-ACD02-0056-22"
        descLabel.text = "Tom Trower  |  20 Mar, 2002"
    }
}
