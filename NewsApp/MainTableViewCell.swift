//
//  MainTableViewCell.swift
//  NewsApp
//
//  Created by user on 07.03.2023.
//

import UIKit

class NewsNodel {
    let title: String?
    let subtitle: String?
    let imageUrl: URL?
    var imageData: Data?

    init(title: String?, subtitle: String?, imageUrl: URL?, imageData: Data? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.imageUrl = imageUrl
        self.imageData = imageData
    }
}

class MainTableViewCell: UITableViewCell {

    private let valueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .semibold)

        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let imageViews: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.backgroundColor = .secondarySystemBackground
        return image
    }()

    static let idMainTableViewCell = "celltable"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imageViews)
        contentView.addSubview(valueLabel)
        contentView.addSubview(subtitleLabel)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with viewModel: NewsNodel) {
        valueLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle

        if let data = viewModel.imageData {
            imageViews.image = UIImage(data: data)
        }
        else if let url = viewModel.imageUrl {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data , error == nil else {
                    return
                }
                viewModel.imageData = data

                DispatchQueue.main.async {
                    self.imageViews.image = UIImage(data: data)
                }
            }.resume()
        }
    }
}

extension MainTableViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([

            imageViews.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            imageViews.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),
            imageViews.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1),
            imageViews.widthAnchor.constraint(equalToConstant: 150),

            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            valueLabel.trailingAnchor.constraint(equalTo: imageViews.leadingAnchor, constant: -1),

            subtitleLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 1),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            subtitleLabel.trailingAnchor.constraint(equalTo: imageViews.leadingAnchor, constant: -1),


        ])
    }
}
