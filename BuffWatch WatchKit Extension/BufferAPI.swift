//
//  BufferData.swift
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



class BufferAPI: NSObject{
    
    
    func get(completionHandler: ((NSArray!, NSError!) -> Void)!) -> Void {
        
        
        let url: NSURL = NSURL(string: "https://api.bufferapp.com/1/profiles/\(getProfileId())/updates/pending?access_token=\(getToken())")!
        let ses = NSURLSession.sharedSession()
        let task = ses.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            if (error != nil) {
                return completionHandler(nil, error)
            }
            
            do{
               
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                
                if (error != nil) {
                    return completionHandler(nil, error)
                } else {
                    return completionHandler(json["updates"] as! [NSDictionary], nil)
                }
            }catch {
                
            }
        })
        task!.resume()
    }
    
    
    
    func getSent(){
        
    }
    
    
    func valueForAPIKey(keyname: String) -> String{
        let filePath = NSBundle.mainBundle().pathForResource("ApiKeys", ofType: "plist")
        let plist = NSDictionary(contentsOfFile: filePath!)
        
        let value: String = plist?.objectForKey(keyname) as! String
        return value
        
    }
    
    func getProfileId() -> NSString {
        return valueForAPIKey("profile_id")
    }
    
    func getToken() -> NSString{
       
        return valueForAPIKey("user_token")
    }
    
  
    
   
    
   }

// BufferAPI.sharedInstance.profiles()
// BufferAPI.sharedInstance.profiles(id: "1212121312")
// BufferAPI.sharedInstance.profiles(id: "12312412432").getSchedules(){
// }



// bufferAPI.sharedInstance.updates(id: "12124213").getInteractions()
// bufferAPI.sharedInstance.profiles(id: "1231341").getPending()
// bufferAPI.sharedInstance.profiles(id: "1231213").getSent()
