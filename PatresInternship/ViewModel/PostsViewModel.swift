//
//  PostsViewModel.swift
//  PatresInternship
//
//  Created by rauan on 7/6/25.
//

import Foundation
import CoreData

class PostsViewModel {
    var posts: [PostModel] = []
//  load data from CoreData
    func loadPostsFromCoreData() -> [PostModel] {
        let request: NSFetchRequest<Posts> = Posts.fetchRequest()
        if let result = try? CoreDataManager.shared.context.fetch(request) {
            return result.map {
                PostModel(userId: Int($0.userId), id: Int($0.id), title: $0.title ?? "", body: $0.text ?? "")
            }
        }
        return []
    }
//    saving posts to CoreData
    func savePostsToCoreData(_ posts: [PostModel]) {
        let context = CoreDataManager.shared.context
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Posts.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        _ = try? context.execute(deleteRequest)

        for post in posts {
            let entity = Posts(context: context)
            entity.userId = Int64(post.userId)
            entity.id = Int64(post.id)
            entity.title = post.title
            entity.text = post.body
        }

        CoreDataManager.shared.saveContext()
    }
//  fetching data from API
    func fetchPosts(updateUI: @escaping (Result<[PostModel], Error>) -> Void) {
        posts = loadPostsFromCoreData()
        updateUI(.success(posts))

        NetworkManager.shared.fetchPostsFromAPI { [weak self] result in
            switch result {
            case .success(let newPosts):
                if newPosts != self?.posts {
                    self?.posts = newPosts
                    self?.savePostsToCoreData(newPosts)
                    updateUI(.success(newPosts))
                }
            case .failure(let error):
                updateUI(.failure(error))
            }
        }
    }
}
