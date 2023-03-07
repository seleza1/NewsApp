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

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getNews()
    var news: [Article]? { get set }
    func tapOnTheNews(news: Article)

}

class MainPresenter: MainViewPresenterProtocol {
    func tapOnTheNews(news: Article) {
        router?.showDetail(news: news)
    }

    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var news: [Article]?
    var router: RouterProtocol?

    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getNews()
    }

    func getNews() {
        networkService.getTopStories { [weak self] result in
            switch result {
            case .success(let news):
                self?.news = news
                self?.view?.succes()
            case .failure(let error):
                self?.view?.failure(error: error)
            }
        }
    }
    
}

