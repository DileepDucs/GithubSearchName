//
//  GithubSearchRequest.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 21/11/21.
//

import Foundation

enum GithubSearchRequest {
    case searchByName(_: String)
    case articlesWithCategory(_: Int, _: String)
}

extension GithubSearchRequest: EndPointType {
    var path: String {
        switch self {
        case .searchByName(let name):
            return "search/repositories?q=\(name)&page=1&per_page=30"
        case .articlesWithCategory(let id, let langCode):
            return "api/v1/news_articles?category_ids=\(id)&language=\(langCode)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .searchByName:
            return .get
        default:
            return .get
        }
    }
    
    var parameters: RequestParams {
        return RequestParams(urlParameters: nil, bodyParameters: nil)
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    var dataType: ResponseDataType {
        return .JSON
    }
    
    
}
