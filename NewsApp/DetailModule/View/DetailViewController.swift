//
//  DetailViewController.swift
//  NewsApp
//
//  Created by user on 07.03.2023.
//

import UIKit

class DetailViewController: UIViewController {

    private let newsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var presenter: DetailViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(newsLabel)
        setConstraints()
        presenter.setNews()


    }
}

extension DetailViewController: DetailViewProtocol {
    func setNews(news: Article?) {
        newsLabel.text = news?.title
    }
}

extension DetailViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            newsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            newsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            newsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)

        ])
    }
}
