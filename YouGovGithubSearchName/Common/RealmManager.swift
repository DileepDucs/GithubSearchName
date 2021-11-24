//
//  RealmManager.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 21/11/21.
//

import Foundation
import RealmSwift

let realmObject = try! Realm()

class RealmManager: NSObject {
    
    // Mark:- Singleton Instance
    static let shared = RealmManager()  
    
    func retrieveAllDataForObject(_ T : Object.Type) -> [Object] {
        
        var objects = [Object]()
        for result in realmObject.objects(T) {
            objects.append(result)
        }
        return objects
    }
    
    /// This function store the items in database
    func write(searchItem: SearchItem?, string: String) {
        if let item = searchItem {
            let realm = try! Realm()
            try! realm.write {
                item.likeDislike = string
                realm.add(item, update: .all)
            }
        }
    }
    
    /// This function return the search object from the database
    /// - parameter id: requested id in database
    /// - returns: search object if it is in database else nil
    func getSavedItemFromLocal(id: Int) -> SearchItem? {
        return getItems(with: SearchItem.self, id: id, ascending: true, filter: .id)
    }
    
    func getItems<T: Object>(with type: T.Type, id: Int, ascending: Bool, filter: Filter) -> SearchItem? {
        do {
            let objects = try queryObjects(with: SearchItem.self, ascending: ascending, filter: filter).map { $0 }
            if let item = objects.first(where: { $0.id == id }) {
                return item
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
    
    func queryObjects<T: Object>(with type: T.Type, ascending: Bool, filter: Filter) throws -> Results<T> {
        let realm = try Realm()
        return realm.objects(T.self).sorted(byKeyPath: filter.rawValue, ascending: ascending)
    }
}

enum Filter: String {
    case id = "id"
}
