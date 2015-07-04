//
//  User.swift
//  BuffWatch
//
//  Created by jay on 7/3/15.
//  Copyright © 2015 Appsilog. All rights reserved.
//

import Foundation

struct User{
    let activity_at: NSDate
    let created_at: NSDate
    let id: String
    let timeZone: String
    
    
}

// BufferAPI.sharedInstance.profiles()
// BufferAPI.sharedInstance.profiles(id: "1212121312")
// BufferAPI.sharedInstance.profiles(id: "12312412432").getSchedules(){
// }



// bufferAPI.sharedInstance.updates(id: "12124213").getInteractions()
// bufferAPI.sharedInstance.profiles(id: "1231341").getPending()
// bufferAPI.sharedInstance.profiles(id: "1231213").getSent()
