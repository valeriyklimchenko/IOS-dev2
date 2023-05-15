//
//  DbDataItem.swift
//  Webinar16
//
//  Created by Bitec mini on 17.04.2023.
//

import Foundation
import RealmSwift


class DbDataItem: Object{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String = ""
    @Persisted var isCompleted: Bool = false

    convenience init(title: String, isCompleted: Bool) {
        self.init()
        self.title = title
        self.isCompleted = isCompleted
    }
    
}
