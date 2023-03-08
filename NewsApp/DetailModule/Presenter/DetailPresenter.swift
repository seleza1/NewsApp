//
//  DetailPresenter.swift
//  NewsApp
//
//  Created by user on 07.03.2023.
//


protocol DetailViewProtocol: AnyObject {
    func setNews(news: Article?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, news: Article?, router: RouterProtocol)
    func setNews()
    func presentInfo()
}

class DetailPresenter: DetailViewPresenterProtocol {
    func presentInfo() {
        router?.pushInfo()
    }


    weak var view: DetailViewProtocol!
    let networkService: NetworkServiceProtocol!
    var news: Article?
    let router: RouterProtocol?

    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, news: Article?, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.news = news
        self.router = router
    }

    func setNews() {
        self.view.setNews(news: news)
    }
}
