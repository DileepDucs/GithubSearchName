//
//  Owner.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 21/11/21.
//

import Realm
import RealmSwift

class Owner: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var login: String? = nil
    @objc dynamic var avatar_url: String? = nil
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatar_url
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        login = try? container.decode(String.self, forKey: .login)
        avatar_url = try? container.decode(String.self, forKey: .avatar_url)
    }
}
