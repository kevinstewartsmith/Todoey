//
//  Item.swift
//  Todoey
//
//  Created by Kevin Smith on 10/2/19.
//  Copyright © 2019 Kevin Smith. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
