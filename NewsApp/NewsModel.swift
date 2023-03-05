//
//  NewsModel.swift
//  NewsApp
//
//  Created by user on 05.03.2023.
//

import Foundation

struct NewsModel: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let source: Source
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
}

struct Source: Decodable {
    let name: String
}
