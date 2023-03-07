//
//  NetworkManager.swift
//  NewsApp
//
//  Created by user on 05.03.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void)
    func fetchImage(completion: @escaping(Result<Data, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {

    struct Constants {
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a1181b2fbad34b75ba37ce0b3e0d335e")
    }

    func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = Constants.topHeadlinesURL else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(News.self, from: data)
                    completion(.success(result.articles))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }

    func fetchImage(completion: @escaping(Result<Data, Error>) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a1181b2fbad34b75ba37ce0b3e0d335e") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(error!))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            DispatchQueue.main.async {
                completion(.success(data))
            }

        }.resume()
    }


}
