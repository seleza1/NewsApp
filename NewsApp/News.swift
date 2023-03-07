//
//  NewsModel.swift
//  NewsApp
//
//  Created by user on 05.03.2023.
//

import Foundation

struct News: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let source: Source
    let title: String
    let description: String
    let urlToImage: String?
}

struct Source: Decodable {
    let name: String
}
