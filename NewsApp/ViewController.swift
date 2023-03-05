//
//  ViewController.swift
//  NewsApp
//
//  Created by user on 05.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.getTopStories { result in
            switch result {
            case .success(let response):
                break
            case .failure(let failure):
                print("error")
            }
        }
    }


}

