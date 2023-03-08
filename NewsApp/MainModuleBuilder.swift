//
//  MainModuleBuilder.swift
//  NewsApp
//
//  Created by user on 07.03.2023.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(news: Article?, router: RouterProtocol) -> UIViewController
    func createInfoModule(router: RouterProtocol) -> UIViewController
}

class ModelBuilder: AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter

        return view
    }

    func createDetailModule(news: Article?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, news: news, router: router)
        view.presenter = presenter

        return view
    }

    func createInfoModule(router: RouterProtocol) -> UIViewController {
        let view = InfoViewController()
        let presenter = InfoPresenter(view: view, router: router)
        view.presenter = presenter

        return view
    }
}
