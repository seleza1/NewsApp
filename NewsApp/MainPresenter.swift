//
//  MainPresenter.swift
//  NewsApp
//
//  Created by user on 07.03.2023.
//

protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)

    func getNews()

}

class MainPresenter: MainPresenterProtocol {
}

