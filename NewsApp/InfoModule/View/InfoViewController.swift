//
//  InfoViewController.swift
//  NewsApp
//
//  Created by user on 08.03.2023.
//

import UIKit

class InfoViewController: UIViewController {

    var presenter: InfoViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }

}

extension InfoViewController: InfoViewProtocol {

}


