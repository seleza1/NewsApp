//
//  NetworkManager.swift
//  NewsApp
//
//  Created by user on 05.03.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func getTopStories(completion: @escaping (Result<[String], Error>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {

    let apiKey = "a5531ed2ed9b4f97856f68ae8091067e"
    static let shared = NetworkManager()

    struct Constants {
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2023-02-05&sortBy=publishedAt&apiKey=a5531ed2ed9b4f97856f68ae8091067e")
    }

    init() {}

    public func getTopStories(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = Constants.topHeadlinesURL else { return }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(News.self, from: data)

                    print(result.articles)
                } catch {
                    completion(.failure(error))
                }
            }


        }
        task.resume()
    }
}
