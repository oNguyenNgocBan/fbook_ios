//
//  BookCollectionViewCell.swift
//  FBook
//
//  Created by Ban Nguyen Ngoc on 9/8/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit
import Kingfisher

class BookCollectionViewCell: UICollectionViewCell {

    var presenter: BookCellPresenter?
    var configurator: BookCellConfigurator?

    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var thumbnailImageView: UIImageView!
    @IBOutlet fileprivate weak var totalViewLabel: UILabel!
    @IBOutlet fileprivate weak var starLabel: UILabel!

}

extension BookCollectionViewCell: BookCellView {

    func displayConfigurator(_ configurator: BookCellConfigurator) {
        self.configurator = configurator
        self.configurator?.configure(cell: self)
        presenter?.loadBook()
    }

    func displayBook(book: Book) {
        nameLabel.text = book.title
        starLabel.text = String(format: "%.01f", book.averageStar)
        totalViewLabel.text = book.totalView.description
        thumbnailImageView.setImage(urlString: book.thumbnail)
    }

}