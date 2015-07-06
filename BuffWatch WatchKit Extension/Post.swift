//
//  Update.swift
//  BuffWatch
//
//  Created by jay on 7/3/15.
//  Copyright © 2015 Appsilog. All rights reserved.
//

import Foundation

struct Post{
    var id: String?
    var due_at: Double?
    var due_time: Double?
    var profile_id: String?
    var profile_service: String?
    var text: String?
    var text_formatted: String?
    var user_id: String?

}

extension Post: JSONDecodable{
    mutating func JSONDecode(JSONDictionary: [String : AnyObject]) {
        JSONDictionary.restore(&id, key: "id")
        JSONDictionary.restore(&due_at, key: "due_at")
        JSONDictionary.restore(&due_time, key: "due_time")
        JSONDictionary.restore(&profile_id, key: "profile_id")
        JSONDictionary.restore(&profile_service, key: "profile_service")
        JSONDictionary.restore(&text, key: "text")
        JSONDictionary.restore(&text_formatted, key: "text_formatted")
        JSONDictionary.restore(&user_id, key: "user_id")
    }
}