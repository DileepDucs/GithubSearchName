//
//  NetworkManagerProtocol.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 21/11/21.
//

import Foundation

protocol NetworkManagerProtocol {
    func startRequest(request: EndPointType, basePath: String, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void)
}
