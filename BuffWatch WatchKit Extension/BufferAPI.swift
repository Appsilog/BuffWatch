//
//  BufferData.swift
//  BuffWatch
//
//  Created by jay on 7/3/15.
//  Copyright © 2015 Appsilog. All rights reserved.
//

import Foundation

class BufferAPI{
    
        static let sharedInstance = BufferAPI()
    
    // prevent creating other instances
    private init() {}
    
    func profiles(id: String) -> Profile {
        let p = Profile()
        p.id = id
        
        return p
    }
    
    
    func valueForAPIKey(keyname: String) -> String{
        let filePath = NSBundle.mainBundle().pathForResource("ApiKeys", ofType: "plist")
        let plist = NSDictionary(contentsOfFile: filePath!)
        
        let value: String = plist?.objectForKey(keyname) as! String
        
        return value
        
    }
    func getToken() -> NSString{
       
        return valueForAPIKey("user_token")
    }
    
  
    
    func updateData(){
        let url = NSURL(string: "https://api.bufferapp.com/1/profiles/55826fd2b0849f1104c7cea7/updates/pending.json?access_token=1/b4e2517d3a7b782c614cd37cc9abb518")
        let session = NSURLSession.sharedSession()
        session.dataTaskWithURL(url!) { (data, response, error) -> Void in
            print(data, appendNewline: true)
        }
        
    }
    
   }