//
//  PostsViewController.swift
//  PatresInternship
//
//  Created by rauan on 7/4/25.
//

import UIKit
import Alamofire

class PostsViewController: UIViewController {
    //MARK: - properties
    var posts: [PostModel] = []
    var viewModel = PostsViewModel()
    private let refreshControl = UIRefreshControl()
    
    private lazy var postTableView: UITableView = {
        let postTableView = UITableView()
        postTableView.delegate = self
        postTableView.dataSource = self
        postTableView.showsVerticalScrollIndicator = false
        postTableView.translatesAutoresizingMaskIntoConstraints = false
        postTableView.separatorStyle = .none
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return postTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupRefreshControl()
        loadPosts()
    }
    //MARK: - Methods
    private func setupConstraints() {
        view.addSubview(postTableView)
        NSLayoutConstraint.activate([
            postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshPulled), for: .valueChanged)
        postTableView.refreshControl = refreshControl
    }

    @objc private func refreshPulled() {
        viewModel.fetchPosts { result in
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                switch result {
                case .success(let posts):
                    self.posts = posts
                    self.postTableView.reloadData()
                case .failure(let error):
                    print("Refresh failed:", error.localizedDescription)
                }
            }
        }
    }
    
    private func loadPosts() {
        viewModel.fetchPosts { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self.posts = posts
                    self.postTableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

//MARK: - Extension - UITableViewDelegate, UITableViewDataSource
extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.configure(title: posts[indexPath.row].title, text: posts[indexPath.row].body)
        cell.setImage(from: "https://picsum.photos/id/\(posts[indexPath.row].userId)/100/100")
        return cell
    }
}
