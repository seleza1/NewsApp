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
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let imagesNews: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()

    var presenter: DetailViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(newsLabel)
        view.addSubview(imagesNews)
        presenter.getImage()

        setConstraints()
        presenter.setNews()
        


    }
}

extension DetailViewController: DetailViewProtocol {
    func setNews(news: Article?) {
        newsLabel.text = news?.description
    }
}

extension DetailViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([

            imagesNews.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            imagesNews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imagesNews.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imagesNews.heightAnchor.constraint(equalToConstant: 200),

            newsLabel.topAnchor.constraint(equalTo: imagesNews.bottomAnchor, constant: 16),
            newsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            newsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),



        ])
    }
}
