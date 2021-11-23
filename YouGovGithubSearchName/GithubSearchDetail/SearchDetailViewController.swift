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
        view.backgroundColor = UIColor.white
        displayImage()
       // baseView.likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
       // baseView.dislikeButton.addTarget(self, action: #selector(didTapDislikeButton), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
    }
    
    func displayImage() {
        if let urlString = searchItem?.owner?.avatar_url {
            baseView.setImageWith(urlString: urlString)
        }
    }

}
