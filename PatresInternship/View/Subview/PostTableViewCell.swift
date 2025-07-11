//
//  PostTableViewCell.swift
//  PatresInternship
//
//  Created by rauan on 7/5/25.
//

import UIKit
import Alamofire

class PostTableViewCell: UITableViewCell {
//    properties
    static let identifier = "postCell"
    
    var postTitle: UILabel = {
        let postTitle = UILabel()
        postTitle.translatesAutoresizingMaskIntoConstraints = false
        postTitle.numberOfLines = 0
        postTitle.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return postTitle
    }()
    
    var postText: UILabel = {
        let postText = UILabel()
        postText.translatesAutoresizingMaskIntoConstraints = false
        postText.numberOfLines = 0
        postText.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return postText
    }()
    
    var userImage: UIImageView = {
        let userImage = UIImageView()
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.layer.cornerRadius = 24
        userImage.clipsToBounds = true
        userImage.contentMode = .scaleAspectFill
        userImage.layer.masksToBounds = true
        return userImage
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.spacing = 6
        stackView.alignment = .fill
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: PostTableViewCell.identifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - methods
    func setupViews() {
        selectionStyle = .none
        stackView.addArrangedSubview(postTitle)
        stackView.addArrangedSubview(postText)
        contentView.addSubview(userImage)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            userImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userImage.widthAnchor.constraint(equalToConstant: 48),
            userImage.heightAnchor.constraint(equalToConstant: 48),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    func configure(title: String, text: String) {
        postTitle.text = title
        postText.text = text
    }
    
    func setImage(from urlString: String) {
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.userImage.image = image
                    }
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
