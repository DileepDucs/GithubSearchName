//
//  SearchViewModel.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 21/11/21.
//

import Foundation

protocol SearchViewModelDelegate {
    func githubSearchSuccessfully()
    func githubSearchFailure()
}

class SearchViewModel {
    var delegate: SearchViewModelDelegate?
    var apiClient = APIClient()
    var searchItems = [SearchItem]()
    
    func fetchSearchList(name: String) {
        let apiData = GithubSearchRequest.searchByName(name)
        apiClient.fetch(request: apiData, basePath: NetworkConstant.Search.url, success: { (data, result) in
            self.parse(dataResponse: data)
        }) { (data, result, error) in
            
        }
    }
    
    func parse(dataResponse: Data) {
        do {
            //here dataResponse received from a network request
            let decoder = JSONDecoder()
            let githubSearch = try decoder.decode(GithubSearch.self, from: dataResponse)
            searchItems.removeAll()
            if let items = githubSearch.items {
                searchItems = items
            }
            self.delegate?.githubSearchSuccessfully()
        } catch let parsingError {
            print("Error", parsingError)
            self.delegate?.githubSearchFailure()
        }
    }
    
    func searchListCount() -> Int {
        return searchItems.count
    }
    
    func getSearchItemWith(index: Int) -> SearchItem {
        return searchItems[index]
    }
}
