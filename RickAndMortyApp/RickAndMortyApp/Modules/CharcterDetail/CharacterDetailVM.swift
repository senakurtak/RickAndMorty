//
//  CharacterDetailVM.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 12.03.2023.
//


import Foundation
import Moya
import RxSwift
import UIKit

class CharacterDetailVM : BaseVM {
    // MARK: Image Manager
    func fetchImage(characterImageUrl: URL!,completion: @escaping (Result<Data,Error>) -> Void){
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
