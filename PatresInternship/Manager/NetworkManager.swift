//
//  NetworkManager.swift
//  PatresInternship
//
//  Created by rauan on 7/6/25.
//

import Foundation
import Alamofire

struct NetworkManager {
    static let shared = NetworkManager()
    
    func fetchPostsFromAPI(completion: @escaping (Result<[PostModel], Error>) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/posts"
        AF.request(url).responseDecodable(of: [PostModel].self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }    
}
