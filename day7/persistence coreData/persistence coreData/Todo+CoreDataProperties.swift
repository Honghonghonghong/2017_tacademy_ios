//
//  Todo+CoreDataProperties.swift
//  persistence coreData
//
//  Created by Tacademy-Mac on 2017. 1. 10..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo");
    }

    @NSManaged public var title: String?
    @NSManaged public var dueDate: NSDate?

}
