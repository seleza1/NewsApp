//
//  MainTableViewCell.swift
//  NewsApp
//
//  Created by user on 07.03.2023.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    static let idMainTableViewCell = "idMainTableViewCell"
    
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
        image.layer.cornerRadius = 6
        image.layer.masksToBounds = true
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imageViews)
        contentView.addSubview(valueLabel)
        contentView.addSubview(subtitleLabel)
        setConstraints()
    }

    override func prepareForReuse() { // чтобы не было глик
        subtitleLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with article: Article) {
        valueLabel.text = article.title
        subtitleLabel.text = article.description
    }
}

extension MainTableViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([

            imageViews.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            imageViews.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),
            imageViews.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1),
            imageViews.widthAnchor.constraint(equalToConstant: 120),

            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            valueLabel.trailingAnchor.constraint(equalTo: imageViews.leadingAnchor, constant: -1),

            subtitleLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 1),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            subtitleLabel.trailingAnchor.constraint(equalTo: imageViews.leadingAnchor, constant: -1)
        ])
    }
}
