//
//  SearchCell.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 21/11/21.
//

import UIKit


class SearchCell: UITableViewCell {
    
    fileprivate let avatarImageView = UIImageView()
    fileprivate let nameLabel = UILabel()
    fileprivate let languageLabel = UILabel()
    fileprivate let stargazersCount = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var search: SearchItem? {
        didSet {
            avatarImageView.sd_setImage(with: URL(string: search?.owner?.avatar_url ?? ""), placeholderImage: UIImage(named: ""))
            nameLabel.text = search?.name
            languageLabel.text = "• \(search?.language ?? "")"
            stargazersCount.text = "\(search?.stargazers_count ?? 0)"
        }
    }
    
    func setupViews() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        stargazersCount.translatesAutoresizingMaskIntoConstraints = false
        
        // add views
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(languageLabel)
        contentView.addSubview(stargazersCount)
        
        // setup views properties
        avatarImageView.contentMode = .scaleAspectFit
        nameLabel.font = .boldSystemFont(ofSize: 17.0)
        nameLabel.numberOfLines = 2
        nameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        languageLabel.textColor = .darkGray
        languageLabel.numberOfLines = 2
        stargazersCount.textColor = .orange
        
        // setup views constraints
        let marginGuide = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            // avatar cover
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            avatarImageView.heightAnchor.constraint(equalToConstant: 80),
            avatarImageView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            avatarImageView.topAnchor.constraint(equalTo: marginGuide.topAnchor),
            avatarImageView.bottomAnchor.constraint(lessThanOrEqualTo: marginGuide.bottomAnchor),
            // name
            nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            // language
            languageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            languageLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            languageLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            // stargazers Count
            stargazersCount.topAnchor.constraint(greaterThanOrEqualTo: languageLabel.bottomAnchor, constant: 8),
            stargazersCount.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            stargazersCount.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor)
        ])
    }
    
}
