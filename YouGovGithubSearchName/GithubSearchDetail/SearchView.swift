//
//  SearchView.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 21/11/21.
//

import UIKit
import Foundation
import SDWebImage

protocol SearchViewDelegate {
    func didTapLikeButton()
    func didTapDislikeButton()
}


class SearchView: UIView {
    fileprivate let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let languageLabel = UILabel()
    private let loginLabel = UILabel()
    fileprivate let starsCountLabel = UILabel()
    private let repoCreationLabel = UILabel()
    private let buttons = UIStackView()
    let likeButton = UIButton()
    let dislikeButton = UIButton()
    var delegate: SearchViewDelegate?
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override func updateConstraints() {
        setupViews()
        super.updateConstraints()
        
    }
    
    var search: SearchItem? {
        didSet {
            avatarImageView.sd_setImage(with: URL(string: search?.owner?.avatar_url ?? ""), placeholderImage: UIImage(named: ""))
            nameLabel.text = "Name: \(search?.name ?? "")"
            languageLabel.text = "Language: \(search?.language ?? "")"
            loginLabel.text = "Login: \(search?.owner?.login ?? "")"
            repoCreationLabel.text = "Created At: \(search?.created_at ?? "")"
            starsCountLabel.text = "Stars: \(search?.stargazers_count ?? 0)"
        }
    }
    
    func setupViews() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        repoCreationLabel.translatesAutoresizingMaskIntoConstraints = false
        starsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        dislikeButton.translatesAutoresizingMaskIntoConstraints = false
        buttons.translatesAutoresizingMaskIntoConstraints = false
        
        
        // add views
        self.addSubview(avatarImageView)
        self.addSubview(nameLabel)
        self.addSubview(languageLabel)
        self.addSubview(loginLabel)
        self.addSubview(repoCreationLabel)
        self.addSubview(starsCountLabel)
        self.addSubview(likeButton)
        self.addSubview(dislikeButton)
        self.addSubview(buttons)
        
        // setup views properties
        avatarImageView.contentMode = .scaleAspectFit
        nameLabel.font = .boldSystemFont(ofSize: 17.0)
        nameLabel.numberOfLines = 2
        nameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        nameLabel.textColor = .white
        
        languageLabel.textColor = .white
        loginLabel.textColor = .white
        repoCreationLabel.textColor = .white
        starsCountLabel.textColor = .orange
        
        likeButton.setImage(#imageLiteral(resourceName: "like"), for: .normal)
        dislikeButton.setImage(#imageLiteral(resourceName: "dislike"), for: .normal)
        buttons.addArrangedSubview(likeButton)
        buttons.addArrangedSubview(dislikeButton)
        buttons.axis = .horizontal
        buttons.alignment = .center
        buttons.distribution = .equalSpacing
        buttons.spacing = 10.0
        
        likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        dislikeButton.addTarget(self, action: #selector(didTapDislikeButton), for: .touchUpInside)
        
        // setup views constraints
        let marginGuide = self.layoutMarginsGuide
        let imageSize: CGFloat = 230.0
        let buttonSize: CGFloat = 50.0
        NSLayoutConstraint.activate([
            // avatar cover
            avatarImageView.widthAnchor.constraint(equalToConstant: imageSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: imageSize),
            avatarImageView.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 50),
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: imageSize),
            avatarImageView.widthAnchor.constraint(equalToConstant: imageSize),
            // name
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 10),
            // language
            languageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            languageLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 10),
            languageLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            // login
            loginLabel.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 10),
            loginLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 10),
            loginLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            // repo creation date
            repoCreationLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 10),
            repoCreationLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 10),
            repoCreationLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            // stargazers Count
            starsCountLabel.topAnchor.constraint(equalTo: repoCreationLabel.bottomAnchor, constant: 10),
            starsCountLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 10),
            starsCountLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            
            buttons.widthAnchor.constraint(equalToConstant: 120),
            likeButton.heightAnchor.constraint(equalToConstant: buttonSize),
            likeButton.widthAnchor.constraint(equalToConstant: buttonSize),

            dislikeButton.heightAnchor.constraint(equalToConstant: buttonSize),
            dislikeButton.widthAnchor.constraint(equalToConstant: buttonSize),

            buttons.topAnchor.constraint(equalTo: starsCountLabel.bottomAnchor, constant: 30),
            buttons.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0.0),
        ])
    }
    
    @objc func didTapLikeButton() {
        delegate?.didTapLikeButton()
    }
    
    @objc func didTapDislikeButton() {
        delegate?.didTapDislikeButton()
    }
    
}
