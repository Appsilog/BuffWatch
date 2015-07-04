//
//  Profile.swift
//  BuffWatch
//
//  Created by jay on 7/3/15.
//  Copyright © 2015 Appsilog. All rights reserved.
//

import Foundation

class Profile {
    var avatar: NSURL?
    var formatted_username: String?
    var id: String?
    var service: String?
    var service_username: String?
    
    func getPending(completion: (result: [Post]) -> Void){
        
    }
    
    func getSent(completion: (result: [Post]) -> Void){
        
    }
    
}