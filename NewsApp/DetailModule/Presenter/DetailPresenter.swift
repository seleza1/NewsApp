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
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, news: Article?)
    func setNews()
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol!
    let networkService: NetworkServiceProtocol!
    var news: Article?


    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, news: Article?) {
        self.view = view
        self.networkService = networkService
        self.news = news
    }

    func setNews() {
        self.view.setNews(news: news)
    }


}
