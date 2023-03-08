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
}

class InfoPresenter: InfoViewPresenterProtocol {

    unowned var view: InfoViewProtocol?
    var router: RouterProtocol?

    required init(view: InfoViewProtocol, router: RouterProtocol) {
        self.router = router
        self.view = view
    }
}
