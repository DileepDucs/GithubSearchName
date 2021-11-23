//
//  SearchView.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 21/11/21.
//

import UIKit
import SDWebImage

class SearchView: UIView {
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let languageLabel = UILabel()
    private let starsLabel = UILabel()
    private let loginLabel = UILabel()
    private let repoCreationLabel = UILabel()
    private let buttons = UIStackView()
    let likeButton = UIButton()
    let dislikeButton = UIButton()
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        likeButton.setImage(#imageLiteral(resourceName: "like"), for: .normal)
        addSubview(likeButton)
        
        dislikeButton.setImage(#imageLiteral(resourceName: "dontlike"), for: .normal)
        addSubview(dislikeButton)
        
        buttons.addArrangedSubview(likeButton)
        buttons.addArrangedSubview(dislikeButton)
        
        buttons.axis = .horizontal
        buttons.alignment = .center
        buttons.distribution = .equalSpacing
        buttons.spacing = 10.0
        addSubview(buttons)
        
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        setupConstraints()
        super.updateConstraints()
    }
    
    private func setupConstraints() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        starsLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        repoCreationLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        dislikeButton.translatesAutoresizingMaskIntoConstraints = false
        buttons.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20.0
        let imageSize: CGFloat = 300.0
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 70.0).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: padding).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        
        let buttonSize: CGFloat = 50.0
        buttons.widthAnchor.constraint(equalToConstant: 120).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        
        dislikeButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        dislikeButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        
        buttons.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
        buttons.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0.0).isActive = true
    }
    
    func setImageWith(urlString: String) {
        self.imageView.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "placeholder1"))
    }
}
