//
//  GithubSearch.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 21/11/21.
//

import Realm
import RealmSwift


class GithubSearch: Object, Decodable {
    @objc dynamic var total_count: Int = 0
    @objc dynamic var incomplete_results: Bool = false
    var items: [SearchItem]? = nil
    
    enum CodingKeys: String, CodingKey {
        case total_count
        case incomplete_results
        case items
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        total_count = try container.decode(Int.self, forKey: .total_count)
        incomplete_results = try container.decode(Bool.self, forKey: .incomplete_results)
        items = try? container.decodeIfPresent([SearchItem].self, forKey: .items)
    }
}
