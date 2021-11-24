//
//  SearchViewModel.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 21/11/21.
//

import Foundation
import Realm
import RealmSwift

// MARK: - SearchViewModelDelegate protocol
protocol SearchViewModelDelegate {
    func githubSearchSuccessfully()
    func githubSearchFailure()
}

class SearchViewModel {
    
    // MARK: - Properties
    var delegate: SearchViewModelDelegate?
    var apiClient = APIClient()
    var searchItems = [SearchItem]()
    
    // This function will fetch list of items on the search of name
    func fetchSearchList(name: String) {
        let apiData = GithubSearchRequest.searchByName(name)
        apiClient.fetch(request: apiData, basePath: NetworkConstant.Search.url, success: { (data, result) in
            self.parse(dataResponse: data)
        }) { (data, result, error) in
            
        }
    }
    
    // This func parse jsn response from the server and store items in variables.
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
    
    
    // This function retun the search items count
    func searchListCount() -> Int {
        return searchItems.count
    }
    
    // This function retturn search object for the given index.
    func getSearchItemWith(index: Int) -> SearchItem {
        return searchItems[index]
    }
}
