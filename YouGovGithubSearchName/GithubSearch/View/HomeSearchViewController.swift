//
//  ViewController.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 20/11/21.
//

import UIKit

class HomeSearchViewController: UITableViewController {
    
    let viewModel = SearchViewModel()
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 10, width: Utility.screenWidth - 30, height: 40))
        searchBar.placeholder = "Search your item"
        searchBar.delegate = self
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        tableView.register(SearchCell.self, forCellReuseIdentifier: "cell")
        setupNavigationBar()
        githubSearchItemsWith(name: "Apple")
    }
    
    private func setupNavigationBar() {
        let navigationBar = UIBarButtonItem(customView: searchBar)
        navigationItem.leftBarButtonItem = navigationBar
    }
    
    func githubSearchItemsWith(name: String) {
        DispatchQueue.main.async {
            ActivityIndicator.start()
        }
        viewModel.fetchSearchList(name: name)
    }
    
    // #pragma mark - Table view data source
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
    
    func pushSearchDetailsViewController(searchItem: SearchItem) {
        let detailViewController = SearchDetailViewController()
        detailViewController.searchItem = searchItem
        navigationController?.pushViewController(detailViewController, animated: true)
    }

}

extension HomeSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        githubSearchItemsWith(name: text)
        searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
}

extension HomeSearchViewController: SearchViewModelDelegate {
    func githubSearchSuccessfully() {
        DispatchQueue.main.async {
            ActivityIndicator.stop()
            self.tableView.reloadData()
        }
    }
    
    func githubSearchFailure() {
        DispatchQueue.main.async {
            ActivityIndicator.stop()
            self.tableView.reloadData()
        }
    }
}


