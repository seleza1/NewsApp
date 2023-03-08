//
//  InfoPresenter.swift
//  NewsApp
//
//  Created by user on 08.03.2023.
//

import Foundation

protocol InfoViewProtocol: AnyObject {

}

protocol InfoViewPresenterProtocol: AnyObject {
    init(view: InfoViewProtocol, router: RouterProtocol)
    func tapButtonShowInfo()

}

class InfoPresenter: InfoViewPresenterProtocol {

    func tapButtonShowInfo() {
        router?.pushInfo()
    }

    weak var view: InfoViewProtocol?
    var router: RouterProtocol?

    required init(view: InfoViewProtocol, router: RouterProtocol) {
        self.router = router
        self.view = view
    }




}
