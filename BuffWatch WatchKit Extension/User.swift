//
//  User.swift
//  BuffWatch
//
//  Created by jay on 7/3/15.
//  Copyright © 2015 Appsilog. All rights reserved.
//

import Foundation

struct User{
    var activity_at:    Double?
    var created_at:     Double?
    var id:             String?
    var timeZone:       String?
}


extension User: JSONDecodable{
    mutating func JSONDecode(JSONDictionary: [String : AnyObject]) {
        JSONDictionary.restore(&activity_at, key: "activity_at")
        JSONDictionary.restore(&created_at, key: "created_at")
        JSONDictionary.restore(&id, key: "id")
        JSONDictionary.restore(&timeZone, key: "timeZone")
    }
}
