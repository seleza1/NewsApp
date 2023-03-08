//
//  Router.swift
//  NewsApp
//
//  Created by user on 07.03.2023.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(news: Article)
    func popToRoot()
    func pushInfo()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?

    init(navigationController: UINavigationController? = nil, assemblyBuilder: AssemblyBuilderProtocol? = nil) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMainModule(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }

    func showDetail(news: Article) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createDetailModule(news: news, router: self) else { return }
            navigationController.present(detailViewController, animated: true)
        }
    }

    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }

    func pushInfo() {
        if let navigationController = navigationController {
            guard let infoViewController = assemblyBuilder?.createInfoModule(router: self) else { return }
            navigationController.pushViewController(infoViewController, animated: true)
            // navigationController.present(infoViewController, animated: true)
        }
    }
}
