//
//  Category.swift
//  Todoey
//
//  Created by Kevin Smith on 10/2/19.
//  Copyright © 2019 Kevin Smith. All rights reserved.
//

import Foundation
import RealmSwift


class Category: Object {
    @objc dynamic var name : String = ""
    
    let items = List<Item>()
}
