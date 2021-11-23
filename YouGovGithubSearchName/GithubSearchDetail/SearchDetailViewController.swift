//
//  SearchDetailViewController.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 21/11/21.
//

import UIKit

class SearchDetailViewController: UIViewController {
    private let baseView = SearchView()
    var searchItem: SearchItem?
    
    override func loadView() {
        view = baseView
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .gray
        baseView.search = searchItem
        baseView.delegate = self
    }

    
    func setupUI() {
        view.addSubview(backButton)
        view.addSubview(headerLabel)
        let buttonSize: CGFloat = 35.0
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 35.0).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40.0).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true        
    }
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "SEARCH ITEM"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "backChevron"), for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension SearchDetailViewController: SearchViewDelegate {
    func didTapLikeButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func didTapDislikeButton() {
        navigationController?.popViewController(animated: true)
    }
}
