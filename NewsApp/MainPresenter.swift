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
    init(view: MainViewProtocol, networkService: NetworkManagerProtocol, router: RouterProtocol)
    func getNews()
    var news: [News]? { get set }

}

class MainPresenter: MainPresenterProtocol {

    weak var view: MainViewProtocol?
    let networkService: NetworkManagerProtocol!
    var news: [News]?
    var router: RouterProtocol?

    required init(view: MainViewProtocol, networkService: NetworkManagerProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getNews()
    }

    func getNews() {
        <#code#>
    }
    
}

