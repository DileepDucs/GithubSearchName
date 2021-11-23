//
//  APIClientProtocol.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 21/11/21.
//

import Foundation

typealias NetworkSuccessHandler = (Data, URLResponse?) -> Void
typealias NetworkFailureHandler = (Data?, URLResponse?, NetworkError) -> Void

protocol APIClientProtocol {
    func fetch<T: Codable>(request: EndPointType,
                             basePath: String,
                             keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy,
                             completionHandler: @escaping ((Result<T, NetworkError>) -> Void))
    
    func fetch(request: EndPointType,
               basePath: String,
               success: @escaping NetworkSuccessHandler,
               failure: @escaping NetworkFailureHandler)
}
