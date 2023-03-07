//
//  MainModuleBuilder.swift
//  NewsApp
//
//  Created by user on 07.03.2023.
//

protocol AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
}

class ModelBuilder: AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkManager()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter

        return view
    }
}
