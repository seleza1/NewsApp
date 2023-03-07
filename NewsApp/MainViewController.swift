//
//  ViewController.swift
//  NewsApp
//
//  Created by user on 05.03.2023.
//

import UIKit

class MainViewController: UIViewController {

    var presenter: MainPresenterProtocol!

    let identifier = "Cell"

    let tableView: UITableView = {
        let tableView = UITableView()

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
    }


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    }


}

extension MainViewController: MainViewProtocol {
    func succes() {
        tableView.reloadData()
    }

    func failure(error: Error) {
        print("error")
    }


}

