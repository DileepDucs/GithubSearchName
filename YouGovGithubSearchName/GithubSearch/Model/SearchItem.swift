//
//  SearchItem.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 21/11/21.
//

import Realm
import RealmSwift

class SearchItem: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String? = nil
    @objc dynamic var stargazers_count: Int = 0
    @objc dynamic var language: String? = nil
    @objc dynamic var created_at: String? = nil
    @objc dynamic var owner: Owner? = nil
    @objc dynamic var likeDislike: String? = nil
    
    
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case stargazers_count
        case language
        case created_at
        case owner
        case likeDislike
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try? container.decode(String.self, forKey: .name)
        stargazers_count = try container.decode(Int.self, forKey: .stargazers_count)
        language = try? container.decode(String.self, forKey: .language)
        created_at = try? container.decode(String.self, forKey: .created_at)
        owner = try? container.decode(Owner.self, forKey: .owner)
        likeDislike = try? container.decode(String.self, forKey: .likeDislike)
    }
    
}

