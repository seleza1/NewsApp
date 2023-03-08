//
//  DetailViewController.swift
//  NewsApp
//
//  Created by user on 07.03.2023.
//

import UIKit

class DetailViewController: UIViewController {

    var presenter: DetailViewPresenterProtocol!

    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Узнать когда была публикация", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2860158086, green: 0.6941199899, blue: 0.3407269716, alpha: 1)

        return button
    }()

    private let greetingsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("show", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2860158086, green: 0.6941199899, blue: 0.3407269716, alpha: 1)

        return button
    }()

    private let newsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let greetingsLabel: UILabel = {
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setConstraints()
        presenter.setNews()
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        greetingsButton.addTarget(self, action: #selector(showGreetings), for: .touchUpInside)
    }

    @objc func tapped() {
        presenter.presentInfo()
    }

    @objc func showGreetings() {
        presenter.setGreetings()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setGreetings(text: String) {
        greetingsLabel.text = text
    }

    func setNews(news: Article?) {
        newsLabel.text = news?.content
    }
}

extension DetailViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([

            imagesNews.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            imagesNews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imagesNews.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imagesNews.heightAnchor.constraint(equalToConstant: 200),

            newsLabel.topAnchor.constraint(equalTo: imagesNews.bottomAnchor, constant: 8),
            newsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            newsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            button.topAnchor.constraint(equalTo: newsLabel.topAnchor, constant: 150),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            greetingsLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16),
            greetingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            greetingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            greetingsButton.topAnchor.constraint(equalTo: greetingsLabel.bottomAnchor, constant: 16),
            greetingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            greetingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)

        ])
    }

    private func addViews() {
        view.addSubview(newsLabel)
        view.addSubview(imagesNews)
        view.addSubview(button)
        view.addSubview(greetingsButton)
        view.addSubview(greetingsLabel)
    }
}
