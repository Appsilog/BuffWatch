//
//  Contants.swift
//  BuffWatch
//
//  Created by jay on 7/3/15.
//  Copyright © 2015 Appsilog. All rights reserved.
//

class Constants {
    static let USER                 = "/user"
    static let USER_DEAUTHORIZE     = "/user/deauthorize"
    
    static let PROFILES             = "/profiles"
    static let PROFILES_ID          = "/profiles/:id"
    static let PROFILES_SCHEDULES   = "/profiles/:id/schedules"
    static let PROFILES_UPDATE      = "/profiles/:id/schedules/update"
    
    static let UPDATES_ID           = "/updates/:id"
    static let UPDATES_PENDING      = "/profiles/:id/updates/pending"
    static let UPDATES_SENT         = "/profiles/:id/updates/sent"
    static let UPDATES_INTERACTIONS = "/updates/:id/interactions"
    
    static let LINKS_SHARES         = "/links/shares"
    static let INFO_CONFIG          = "/info/configuration"
    
    
}