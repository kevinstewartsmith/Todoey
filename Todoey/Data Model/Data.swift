//
//  Data.swift
//  Todoey
//
//  Created by Kevin Smith on 10/1/19.
//  Copyright © 2019 Kevin Smith. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var age : Int = 0
}
