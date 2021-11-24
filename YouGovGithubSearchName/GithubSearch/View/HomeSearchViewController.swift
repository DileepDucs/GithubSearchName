//
//  ViewController.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 20/11/21.
//

import UIKit

class HomeSearchViewController: UITableViewController {
    
    // MARK: - Properties
    let viewModel = SearchViewModel()
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 10, width: Utility.screenWidth - 30, height: 40))
        searchBar.placeholder = "Search your item"
        searchBar.delegate = self
        return searchBar
    }()
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        tableView.register(SearchCell.self, forCellReuseIdentifier: "cell")
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        tableView.reloadData()
    }
    
    private func setupNavigationBar() {
        let navigationBar = UIBarButtonItem(customView: searchBar)
        navigationItem.leftBarButtonItem = navigationBar
    }
    
    // This function call api with the search name
    func githubSearchItemsWith(name: String) {
        DispatchQueue.main.async {
            ActivityIndicator.start()
        }
        viewModel.fetchSearchList(name: name)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchListCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let search = viewModel.getSearchItemWith(index: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchCell
        cell.search = search
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let search = viewModel.getSearchItemWith(index: indexPath.row)
        pushSearchDetailsViewController(searchItem: search)
    }
    
    
    /// This function navigate to the search detail screen.
    func pushSearchDetailsViewController(searchItem: SearchItem) {
        let detailViewController = SearchDetailViewController()
        detailViewController.searchItem = searchItem
        navigationController?.pushViewController(detailViewController, animated: true)
    }

}

// MARK: - UISearchBarDelegate for search action
extension HomeSearchViewController: UISearchBarDelegate {
    
    // This function get called on search button clicked in keyboards and call API to fetch the results.
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        githubSearchItemsWith(name: text)
        searchBar.endEditing(true)
    }
}


// MARK: - SearchViewModelDelegate for success and failure response
extension HomeSearchViewController: SearchViewModelDelegate {
    
    /// This function get called on success respone, stop the ActivityIndicator and reaload tableView
    func githubSearchSuccessfully() {
        DispatchQueue.main.async {
            ActivityIndicator.stop()
            self.tableView.reloadData()
        }
    }
    
    /// This function get called on failure respone, stop the ActivityIndicator and reaload tableView
    func githubSearchFailure() {
        DispatchQueue.main.async {
            ActivityIndicator.stop()
            self.tableView.reloadData()
        }
    }
}


