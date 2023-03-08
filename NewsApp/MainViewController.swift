//
//  ViewController.swift
//  NewsApp
//
//  Created by user on 05.03.2023.
//

import UIKit
import SafariServices

class MainViewController: UIViewController {

    var presenter: MainViewPresenterProtocol!
    let networkManager = NetworkService()

    private var viewModel = [NewsNodel]()
    private var articles  = [Article]()



    let identifier = "Cell"


    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .white
        setConstraints()
        setTableView()


        networkManager.getTopStories { result in
            switch result {
            case .success(let success):
                self.articles = success
                self.viewModel = success.compactMap({ NewsNodel(title: $0.title, subtitle: $0.description, imageUrl: URL(string: $0.urlToImage ?? ""))
                })
                DispatchQueue.main.async {
                self.tableView.reloadData()
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.news?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.idMainTableViewCell, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        let news = presenter.news?[indexPath.row]

        cell.configure(with: viewModel[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let news = presenter.news?[indexPath.row]
//        presenter.tapOnTheNews(news: news!)

        tableView.deselectRow(at: indexPath, animated: true)
        let article = articles[indexPath.row]

        guard let url = URL(string: article.url) else { return }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        

    }
}

extension MainViewController: MainViewProtocol {
    func succes() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func failure(error: Error) {
        print("error")
    }
}

extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }

    private func setTableView() {
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.idMainTableViewCell)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
    }
}

