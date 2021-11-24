//
//  SearchDetailViewController.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 21/11/21.
//

import UIKit
import Realm
import RealmSwift

class SearchDetailViewController: UIViewController {
    
    // MARK: - Properties
    private let baseView = SearchView()
    var searchItem: SearchItem?
    
    // MARK: - Life cycle methods
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

    /// Initial UI setup
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
    
    
    // MARK: - Button Action
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - SearchViewDelegate for like and dislike buton action
extension SearchDetailViewController: SearchViewDelegate {
    
    /// This function store like info in Realm and navigate to the previous screen
    func didTapLikeButton() {
        RealmManager.shared.write(searchItem: searchItem, string: "like")
        navigationController?.popViewController(animated: true)
    }
    
    /// This function store ldisike info in Realm and navigate to the previous screen
    func didTapDislikeButton() {
        RealmManager.shared.write(searchItem: searchItem, string: "dislike")
        navigationController?.popViewController(animated: true)
    }
}
